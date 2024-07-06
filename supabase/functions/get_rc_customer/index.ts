/// <reference types="https://esm.sh/v135/@supabase/functions-js@2.4.1/src/edge-runtime.d.ts" />

import { toCustomerInfo } from "../types/customer_info.ts";
import { corsHeaders } from "../utils/cors.ts";
import RevenueCat from "../utils/revenuecat.ts";
import { getSupabaseClient } from "../utils/supabase.ts";

const getRevenueCatCustomer = async (
  rc: RevenueCat,
  userId: string,
) => {
  const customer = await rc.getCustomerInfo(userId);
  if (customer) {
    return {
      customer: toCustomerInfo(customer),
      status: 200,
    };
  } else {
    return {
      error: "Customer not found",
      status: 404,
    };
  }
};

Deno.serve(async (req) => {
  if (req.method !== "GET") {
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

  const rc = RevenueCat.fromEnv();
  const result = await getRevenueCatCustomer(rc, userId);
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
