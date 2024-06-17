import { createClient } from "https://esm.sh/@supabase/supabase-js@2.42.4";
import { getEnv } from "./env.ts";

export function getSupabaseClient(authToken: string | null = null) {
  const headers: Record<string, string> = {};

  if (authToken) {
    headers["Authorization"] = authToken;
  }
  const supabaseUrl = getEnv("SU_URL", "SUPABASE_URL") ?? "";
  const supabaseKey = getEnv(
    "SERVICE_KEY",
    "ANON_KEY",
    "SUPABASE_ANON_KEY",
    "SUPABASE_SERVICE_KEY",
  ) ?? "";

  // Create a Supabase client with the Auth context of the logged in user.
  const supabaseClient = createClient(
    // Supabase API URL - env var exported by default.
    // Deno.env.get("SUPABASE_URL") ?? "",
    supabaseUrl,
    // Supabase API ANON KEY - env var exported by default.
    // Deno.env.get("SUPABASE_ANON_KEY") ?? "",
    supabaseKey,
    // Create client with Auth context of the user that called the function.
    // This way your row-level-security (RLS) policies are applied.
    {
      global: {
        headers: headers,
      },
    },
  );
  return supabaseClient;
}
