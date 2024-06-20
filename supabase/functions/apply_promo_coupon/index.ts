/// <reference types="https://esm.sh/v135/@supabase/functions-js@2.4.1/src/edge-runtime.d.ts" />

import { SupabaseClient } from "https://esm.sh/v135/@supabase/supabase-js@2.42.4/dist/module/index.js";
import { corsHeaders } from "../utils/cors.ts";
import {
  getSupabaseClient,
  getSupabaseServiceClient,
} from "../utils/supabase.ts";

const applyPromoCoupon = async (
  serviceClient: SupabaseClient,
  userId: string,
  code: string,
) => {
  const results = await serviceClient.from("promo_coupons").select().eq(
    "code",
    code,
  ).eq("userId", userId).is("claimedAt", null).limit(1);

  if (!results.data || results.data.length === 0) {
    return {
      error: "Coupon not found",
      status: 404,
    };
  }

  const promo = results.data[0];
  const now = new Date();
  const expiryDate = new Date(now.setDate(now.getDate() + promo.duration));

  const proPlan = {
    planName: "Pro",
    syncHr: 720,
    collections: 50,
    syncInt: 5,
    ads: false,
    edit: true,
    encrypt: true,
    devices: 10,
  };

  const subscription = await serviceClient.from("subscription").upsert({
    userId: promo.userId,
    modified: new Date().toISOString(),
    planName: proPlan.planName,
    subId: "Trial",
    source: "Promo",
    trialStart: new Date().toISOString(),
    trialEnd: expiryDate.toISOString(),
    collections: proPlan.collections,
    syncHr: proPlan.syncHr,
    ads: proPlan.ads,
    edit: proPlan.edit,
    encrypt: proPlan.encrypt,
    devices: proPlan.devices,
    syncInt: proPlan.syncInt,
  }, {
    onConflict: "userId",
  }).select();

  if (subscription.status === 201 || subscription.status === 200) {
    await serviceClient.from("promo_coupons").update({
      claimedAt: now.toISOString(),
    }).eq("id", promo.id);
    return {
      status: subscription.status,
      subscription: subscription.data?.at(0),
    };
  }
  return {
    status: 400,
    error: "Something went wrong!",
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
  if (!userId) {
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

  const result = await applyPromoCoupon(serviceClient, userId, code);

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
