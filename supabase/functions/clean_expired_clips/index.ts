/// <reference types="https://esm.sh/v135/@supabase/functions-js@2.4.1/src/edge-runtime.d.ts" />

import { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2.42.4";
import { refreshGoogleToken } from "../utils/google.ts";

async function cleanExpiredMediaClips(client: SupabaseClient) {
  let offset = 0;
  while (true) {
    const data = await client.from("get_user_clipboard_sync_duration(3, 24)")
      .select("*").range(offset, offset + 100);

    if (!data.data) {
      console.warn("No account found!");
      break;
    }

    for (let row of data.data) {
      const { id, syncHr } = row;
      const result = await refreshGoogleToken(client, id);
      if (result.status !== 200) {
        console.error(result);
        continue;
      }
      const { access_token } = result;
      if (!access_token) {
        console.error("No access token found!");
        continue;
      }

      const { data, error } = await client.rpc(
        "get_expired_media_clipboard_item(3, 24)",
      );

      if (error) {
        console.error(error);
        continue;
      }
      const { data: items } = data;
      if (!items) {
        console.error("No items found!");
        continue;
      }
    }

    // break when no more data is available
    if (!data.count || data.count < 100) {
      break;
    }
    offset += 100;
  }
}

async function cleanClipboards(
  client: SupabaseClient,
) {
  cleanExpiredMediaClips(client);
}

Deno.serve(async (req) => {
  const { name } = await req.json();
  const data = {
    message: `Hello ${name}!`,
  };

  return new Response(
    JSON.stringify(data),
    { headers: { "Content-Type": "application/json" } },
  );
});

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/clean_expired_clips' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
