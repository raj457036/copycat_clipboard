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
    "SUPABASE_SERVICE_ROLE_KEY",
  ) ?? "";

  // Create a Supabase client with the Auth context of the logged in user.
  const supabaseClient = createClient(
    // Supabase API URL - env var exported by default.
    // Deno.env.get("SUPABASE_URL") ?? "",
    supabaseUrl,
    // Supabase API ANON key - env var exported by default.
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

export function getSupabaseServiceClient() {
  const headers: Record<string, string> = {};
  const supabaseUrl = getEnv("SU_URL", "SUPABASE_URL") ?? "";
  const supabaseKey = getEnv(
    "SERVICE_KEY",
    "SUPABASE_SERVICE_ROLE_KEY",
  ) ?? "";
  const supabaseAnonKey = getEnv(
    "ANON_KEY",
    "SUPABASE_ANON_KEY",
  ) ?? "";

  if (supabaseKey) {
    headers["Authorization"] = "Bearer " + supabaseKey;
  }

  // Create a Supabase client with the Auth context of the logged in user.
  const supabaseClient = createClient(
    // Supabase API URL - env var exported by default.
    // Deno.env.get("SUPABASE_URL") ?? "",
    supabaseUrl,
    // Supabase API ANON key - env var exported by default.
    // Deno.env.get("SUPABASE_ANON_KEY") ?? "",
    supabaseAnonKey,
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
