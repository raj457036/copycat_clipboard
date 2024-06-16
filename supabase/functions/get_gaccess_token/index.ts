// Google OAUTH https://developers.google.com/identity/protocols/oauth2/web-server

/// <reference types="https://esm.sh/v135/@supabase/functions-js@2.3.1/src/edge-runtime.d.ts" />
import {
  createClient,
  SupabaseClient,
} from "https://esm.sh/@supabase/supabase-js@2.42.4";
import { GTokenResponse, refreshGoogleToken } from "../utils/google.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey",
  "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
};

type SetupTokenPayload = {
  code?: string;
};

async function setupTokens(
  client: SupabaseClient,
  code: string,
) {
  const { data: { user }, error: authError } = await client.auth.getUser();

  if (authError) {
    console.error(authError);
    return new Response(JSON.stringify(authError), { status: 401 });
  }

  const url = "https://www.googleapis.com/oauth2/v4/token";

  const payload = new URLSearchParams({
    "client_id": Deno.env.get("GOOGLE_CLIENT_ID") ?? "",
    "client_secret": Deno.env.get("GOOGLE_CLIENT_SECRET") ?? "",
    "redirect_uri": "https://connect.entilitystudio.com",
    "grant_type": "authorization_code",
    "code": code,
  });

  const response = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: payload.toString(),
  });

  const responseJson = await response.json();
  console.log(response.status);

  if (response.status !== 200) {
    return new Response(JSON.stringify(responseJson), {
      status: response.status,
    });
  }

  const { access_token, expires_in, refresh_token, scope } =
    responseJson as GTokenResponse;

  const userId = user!.id;
  const issued_at = new Date().toISOString();
  const result = await client.from("drive_credentials").upsert({
    "userId": userId,
    "access_token": access_token,
    "refresh_token": refresh_token,
    "expires_in": expires_in,
    "scopes": scope.split(" "),
  }, {
    onConflict: "userId",
  }).select();

  const { data: _, error: credError } = result;

  return new Response(
    JSON.stringify({
      "access_token": access_token,
      "expires_in": expires_in,
      "issued_at": issued_at,
      "scopes": scope.split(" "),
      "error": credError,
    }),
    { status: credError ? 400 : 200 },
  );
}

Deno.serve(async (req) => {
  const { method } = req;

  if (method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    // Create a Supabase client with the Auth context of the logged in user.
    const supabaseClient = createClient(
      // Supabase API URL - env var exported by default.
      // Deno.env.get("SUPABASE_URL") ?? "",
      "https://jyawrokzkzfjturwttte.supabase.co",
      // Supabase API ANON KEY - env var exported by default.
      // Deno.env.get("SUPABASE_ANON_KEY") ?? "",
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp5YXdyb2t6a3pmanR1cnd0dHRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMxMTU2NTAsImV4cCI6MjAyODY5MTY1MH0.zEY_hQyUEmFra4Tym-e81nAJZoyt_WafCkBmKKvl9L4",
      // Create client with Auth context of the user that called the function.
      // This way your row-level-security (RLS) policies are applied.
      {
        global: {
          headers: { Authorization: req.headers.get("Authorization")! },
        },
      },
    );

    console.log(JSON.stringify(Deno.env.get("GOOGLE_CLIENT_ID")));

    let payload: SetupTokenPayload | null = null;
    if (method === "POST") {
      const body = await req.json();
      if (!body.code) {
        throw new Error("auth code must be present in body.");
      }
      payload = body as SetupTokenPayload;
    }

    // call relevant method based on method and id
    switch (true) {
      case method === "GET": {
        const { data: { user }, error: authError } = await supabaseClient.auth
          .getUser();

        if (authError) {
          console.error(authError);
          return new Response(JSON.stringify(authError), { status: 401 });
        }
        const result = await refreshGoogleToken(supabaseClient, user!.id);
        return new Response(
          JSON.stringify(result),
          {
            status: result.status,
          },
        );
      }
      case payload && method === "POST":
        return setupTokens(supabaseClient, payload.code!);
      default:
        return new Response(JSON.stringify({ "error": "not-supported" }));
    }
  } catch (error) {
    console.error(error);

    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
      status: 400,
    });
  }
});

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/get_gaccess_token' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
