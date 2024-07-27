export default class RevenueCat {
  private apiKey: string;
  private baseUrl = "https://api.revenuecat.com/v1/";

  constructor(apiKey: string) {
    this.apiKey = apiKey;
  }

  static fromEnv() {
    const apiKey = Deno.env.get("REVENUECAT_API_KEY");
    if (!apiKey) {
      throw new Error("RevenueCat API key is not set.");
    }
    return new RevenueCat(apiKey);
  }

  async getCustomerInfo(app_user_id: string) {
    const url = `${this.baseUrl}subscribers/${app_user_id}`;

    try {
      const response = await fetch(
        url,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${this.apiKey}`,
          },
        },
      );

      return response.json();
    } catch (error) {
      console.error("Error fetching customer info:", error);
      return null;
    }
  }

  async revokeGrantedEntitlement(
    app_user_id: string,
    entitlement_identifier: string,
  ) {
    const url =
      `${this.baseUrl}subscribers/${app_user_id}/entitlements/${entitlement_identifier}/revoke_promotionals`;

    const response = await fetch(
      url,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${this.apiKey}`,
        },
      },
    );

    return response.json();
  }

  async grantEntitlement(
    app_user_id: string,
    entitlement_identifier: string,
    end_time: number,
  ) {
    const url =
      `${this.baseUrl}subscribers/${app_user_id}/entitlements/${entitlement_identifier}/promotional`;

    const response = await fetch(
      url,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${this.apiKey}`,
        },
        body: JSON.stringify({
          end_time_ms: end_time,
        }),
      },
    );

    const result = await response.json();
    return result;
  }
}
