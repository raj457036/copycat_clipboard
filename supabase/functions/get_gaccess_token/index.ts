// Google OAUTH https://developers.google.com/identity/protocols/oauth2/web-server

/// <reference types="https://esm.sh/v135/@supabase/functions-js@2.3.1/src/edge-runtime.d.ts" />
import { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2.42.4";
import { corsHeaders } from "../utils/cors.ts";
import { GTokenResponse, refreshGoogleToken } from "../utils/google.ts";
import { getSupabaseClient } from "../utils/supabase.ts";

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
    const authToken = req.headers.get("Authorization");
    const supabaseClient = getSupabaseClient(authToken);

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
