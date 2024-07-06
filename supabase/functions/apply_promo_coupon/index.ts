/// <reference types="https://esm.sh/v135/@supabase/functions-js@2.4.1/src/edge-runtime.d.ts" />

import { SupabaseClient } from "https://esm.sh/v135/@supabase/supabase-js@2.42.4/dist/module/index.js";
import { toCustomerInfo } from "../types/customer_info.ts";
import { corsHeaders } from "../utils/cors.ts";
import RevenueCat from "../utils/revenuecat.ts";
import {
  getSupabaseClient,
  getSupabaseServiceClient,
} from "../utils/supabase.ts";

const applyPromoCoupon = async (
  rc: RevenueCat,
  serviceClient: SupabaseClient,
  email: string,
  userId: string,
  code: string,
) => {
  const results = await serviceClient.from("promo_coupons").select().eq(
    "code",
    code,
  ).eq("email", email).is("claimedAt", null).limit(1);

  if (!results.data || results.data.length === 0) {
    return {
      error: "Coupon not found",
      status: 404,
    };
  }

  const promo = results.data[0];
  const planEntitlementId = promo.plan;
  const customer = await rc.getCustomerInfo(userId);
  if (customer) {
    const entitlement = customer.subscriber.entitlements[planEntitlementId];
    if (
      entitlement && new Date(entitlement.expires_date).getTime() > Date.now()
    ) {
      return {
        error: "You already have an active plan.",
        status: 409,
      };
    }
  } else {
    return {
      error: "Customer not found",
      status: 404,
    };
  }

  const now = new Date();
  const expiryDate = new Date(now.setDate(now.getDate() + promo.duration));

  const updatedCustomer = await rc.grantEntitlement(
    userId,
    planEntitlementId,
    expiryDate.getTime(),
  );

  await serviceClient.from("promo_coupons").update({
    claimedAt: now.toISOString(),
    claimedBy: userId,
  }).eq("id", promo.id);

  return {
    status: 201,
    customer: toCustomerInfo(updatedCustomer),
  };
};

Deno.serve(async (req) => {
  if (req.method !== "POST") {
    return new Response(
      JSON.stringify({
        error: "Method not supported",
      }),
      {
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
        status: 405,
      },
    );
  }
  const authToken = req.headers.get("Authorization");
  const supabaseClient = getSupabaseClient(authToken);
  const serviceClient = getSupabaseServiceClient();
  const user = await supabaseClient.auth.getUser();
  const userId = user.data.user?.id;
  const email = user.data.user?.email;
  if (!userId || !email) {
    return new Response(
      JSON.stringify({
        error: "User not found",
      }),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
        status: 401,
      },
    );
  }

  const { code } = await req.json();

  if (!code) {
    return new Response(
      JSON.stringify({
        error: "Code not found",
      }),
      {
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
        status: 400,
      },
    );
  }
  const rc = RevenueCat.fromEnv();

  const result = await applyPromoCoupon(rc, serviceClient, email, userId, code);

  return new Response(
    JSON.stringify(result),
    {
      headers: {
        ...corsHeaders,
        "Content-Type": "application/json",
      },
      status: result.status,
    },
  );
});
