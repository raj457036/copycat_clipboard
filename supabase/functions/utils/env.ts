export function getEnv(...keys: string[]) {
  for (const key in keys) {
    if (Deno.env.get(keys[key])) {
      return Deno.env.get(keys[key]);
    }
  }
}
