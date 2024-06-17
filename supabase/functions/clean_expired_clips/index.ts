/// <reference types="https://esm.sh/v135/@supabase/functions-js@2.4.1/src/edge-runtime.d.ts" />

import { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2.42.4";
import { refreshGoogleToken } from "../utils/google.ts";
import { getSupabaseClient } from "../utils/supabase.ts";

async function cleanExpiredMediaClips(client: SupabaseClient) {
  // current account query offset
  let aqOffset = 0;
  while (true) {
    const accounts = await client.rpc(
      "get_user_clipboard_sync_duration",
      {
        grace_period: 3,
        free_hr: 24,
      },
    )
      .select("*").range(aqOffset, aqOffset + 100);
    console.log(JSON.stringify(accounts));

    if (!accounts.data) {
      console.warn("No accounts found!");
      break;
    }

    for (const row of accounts.data) {
      const { id, syncHr } = row;

      console.info("Running cleanup for User Id: ", id);

      // refresh the google auth token
      const result = await refreshGoogleToken(client, id);
      if (result.status !== 200) {
        console.error(result);
        console.warn(
          "Error refreshing google token, skipping further operations.",
        );
        continue;
      }
      const { access_token } = result;
      if (!access_token) {
        console.error("No access token found!, skipping further operations.");
        continue;
      }

      let ciOffset = 0;
      while (true) {
        // get already expired media/file type clipboard items
        const clips = await client.rpc(
          "get_expired_media_clipboard_item",
          {
            userId: id,
            syncHr: syncHr,
          },
        )
          .select("*").range(ciOffset, ciOffset + 100);

        if (!clips.data) {
          console.warn(
            "No media/file clips found for the user, skipping further operations.",
          );
          break;
        }

        const fileIds = clips.data!.map((c) => c.fileId);

        // await batchDeleteDriveFiles(fileIds, access_token);
        console.log(fileIds);

        console.info("Finished cleanup for User Id: ", id);

        // break when no more data is available
        if (!clips.count || clips.count < 100) {
          break;
        }
        ciOffset += 100;
      }
    }

    // break when no more data is available
    if (!accounts.count || accounts.count < 100) {
      break;
    }
    aqOffset += 100;
  }
}

async function cleanClipboards(
  client: SupabaseClient,
) {
  await cleanExpiredMediaClips(client);
}

Deno.serve(async (req) => {
  const authToken = req.headers.get("Authorization");
  const supabaseClient = getSupabaseClient(authToken);

  await cleanClipboards(supabaseClient);

  return new Response(
    JSON.stringify({ "done": true }),
    { headers: { "Content-Type": "application/json" } },
  );
});
