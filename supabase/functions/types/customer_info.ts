/**
 * Error codes for the Purchases SDK.
 * @public
 */
enum ErrorCode {
  UnknownError = 0,
  UserCancelledError = 1,
  StoreProblemError = 2,
  PurchaseNotAllowedError = 3,
  PurchaseInvalidError = 4,
  ProductNotAvailableForPurchaseError = 5,
  ProductAlreadyPurchasedError = 6,
  ReceiptAlreadyInUseError = 7,
  InvalidReceiptError = 8,
  MissingReceiptFileError = 9,
  NetworkError = 10,
  InvalidCredentialsError = 11,
  UnexpectedBackendResponseError = 12,
  InvalidAppUserIdError = 14,
  OperationAlreadyInProgressError = 15,
  UnknownBackendError = 16,
  InvalidAppleSubscriptionKeyError = 17,
  IneligibleError = 18,
  InsufficientPermissionsError = 19,
  PaymentPendingError = 20,
  InvalidSubscriberAttributesError = 21,
  LogOutWithAnonymousUserError = 22,
  ConfigurationError = 23,
  UnsupportedError = 24,
  EmptySubscriberAttributesError = 25,
  CustomerInfoError = 28,
  SignatureVerificationError = 36,
  InvalidEmailError = 38,
}

class ErrorCodeUtils {
  static getPublicMessage(errorCode: ErrorCode): string {
    switch (errorCode) {
      case ErrorCode.UnknownError:
        return "Unknown error.";
      case ErrorCode.UserCancelledError:
        return "Purchase was cancelled.";
      case ErrorCode.StoreProblemError:
        return "There was a problem with the store.";
      case ErrorCode.PurchaseNotAllowedError:
        return "The device or user is not allowed to make the purchase.";
      case ErrorCode.PurchaseInvalidError:
        return "One or more of the arguments provided are invalid.";
      case ErrorCode.ProductNotAvailableForPurchaseError:
        return "The product is not available for purchase.";
      case ErrorCode.ProductAlreadyPurchasedError:
        return "This product is already active for the user.";
      case ErrorCode.ReceiptAlreadyInUseError:
        return "There is already another active subscriber using the same receipt.";
      case ErrorCode.InvalidReceiptError:
        return "The receipt is not valid.";
      case ErrorCode.MissingReceiptFileError:
        return "The receipt is missing.";
      case ErrorCode.NetworkError:
        return "Error performing request.";
      case ErrorCode.InvalidCredentialsError:
        return "There was a credentials issue. Check the underlying error for more details.";
      case ErrorCode.UnexpectedBackendResponseError:
        return "Received unexpected response from the backend.";
      case ErrorCode.InvalidAppUserIdError:
        return "The app user id is not valid.";
      case ErrorCode.OperationAlreadyInProgressError:
        return "The operation is already in progress.";
      case ErrorCode.UnknownBackendError:
        return "There was an unknown backend error.";
      case ErrorCode.InvalidAppleSubscriptionKeyError:
        return (
          "Apple Subscription Key is invalid or not present. " +
          "In order to provide subscription offers, you must first generate a subscription key. " +
          "Please see https://docs.revenuecat.com/docs/ios-subscription-offers for more info."
        );
      case ErrorCode.IneligibleError:
        return "The User is ineligible for that action.";
      case ErrorCode.InsufficientPermissionsError:
        return "App does not have sufficient permissions to make purchases.";
      case ErrorCode.PaymentPendingError:
        return "The payment is pending.";
      case ErrorCode.InvalidSubscriberAttributesError:
        return "One or more of the attributes sent could not be saved.";
      case ErrorCode.LogOutWithAnonymousUserError:
        return "Called logOut but the current user is anonymous.";
      case ErrorCode.ConfigurationError:
        return "There is an issue with your configuration. Check the underlying error for more details.";
      case ErrorCode.UnsupportedError:
        return (
          "There was a problem with the operation. Looks like we doesn't support " +
          "that yet. Check the underlying error for more details."
        );
      case ErrorCode.EmptySubscriberAttributesError:
        return "A request for subscriber attributes returned none.";
      case ErrorCode.CustomerInfoError:
        return "There was a problem related to the customer info.";
      case ErrorCode.SignatureVerificationError:
        return "Request failed signature verification. Please see https://rev.cat/trusted-entitlements for more info.";
      case ErrorCode.InvalidEmailError:
        return "Email is not valid. Please provide a valid email address.";
    }
  }

  static getErrorCodeForBackendErrorCode(
    backendErrorCode: BackendErrorCode,
  ): ErrorCode {
    switch (backendErrorCode) {
      case BackendErrorCode.BackendStoreProblem:
        return ErrorCode.StoreProblemError;
      case BackendErrorCode.BackendCannotTransferPurchase:
        return ErrorCode.ReceiptAlreadyInUseError;
      case BackendErrorCode.BackendInvalidReceiptToken:
        return ErrorCode.InvalidReceiptError;
      case BackendErrorCode.BackendInvalidPlayStoreCredentials:
      case BackendErrorCode.BackendInvalidAuthToken:
      case BackendErrorCode.BackendInvalidAPIKey:
        return ErrorCode.InvalidCredentialsError;
      case BackendErrorCode.BackendInvalidPaymentModeOrIntroPriceNotProvided:
      case BackendErrorCode.BackendProductIdForGoogleReceiptNotProvided:
      case BackendErrorCode.BackendOfferNotFound:
        return ErrorCode.PurchaseInvalidError;
      case BackendErrorCode.BackendAlreadySubscribedError:
        return ErrorCode.ProductAlreadyPurchasedError;
      case BackendErrorCode.BackendEmptyAppUserId:
        return ErrorCode.InvalidAppUserIdError;
      case BackendErrorCode.BackendPlayStoreQuotaExceeded:
        return ErrorCode.StoreProblemError;
      case BackendErrorCode.BackendPlayStoreInvalidPackageName:
      case BackendErrorCode.BackendInvalidPlatform:
        return ErrorCode.ConfigurationError;
      case BackendErrorCode.BackendPlayStoreGenericError:
        return ErrorCode.StoreProblemError;
      case BackendErrorCode.BackendUserIneligibleForPromoOffer:
        return ErrorCode.IneligibleError;
      case BackendErrorCode.BackendInvalidSubscriberAttributes:
      case BackendErrorCode.BackendInvalidSubscriberAttributesBody:
        return ErrorCode.InvalidSubscriberAttributesError;
      case BackendErrorCode.BackendInvalidAppStoreSharedSecret:
      case BackendErrorCode.BackendInvalidAppleSubscriptionKey:
      case BackendErrorCode.BackendBadRequest:
      case BackendErrorCode.BackendInternalServerError:
        return ErrorCode.UnexpectedBackendResponseError;
      case BackendErrorCode.BackendProductIDsMalformed:
        return ErrorCode.UnsupportedError;
      case BackendErrorCode.BackendInvalidEmail:
      case BackendErrorCode.BackendNoMXRecordsFound:
        return ErrorCode.InvalidEmailError;
    }
  }

  static convertCodeToBackendErrorCode(code: number): BackendErrorCode | null {
    if (code in BackendErrorCode) {
      return code as BackendErrorCode;
    } else {
      return null;
    }
  }
}

enum BackendErrorCode {
  BackendInvalidPlatform = 7000,
  BackendInvalidEmail = 7012,
  BackendStoreProblem = 7101,
  BackendCannotTransferPurchase = 7102,
  BackendInvalidReceiptToken = 7103,
  BackendInvalidAppStoreSharedSecret = 7104,
  BackendInvalidPaymentModeOrIntroPriceNotProvided = 7105,
  BackendProductIdForGoogleReceiptNotProvided = 7106,
  BackendInvalidPlayStoreCredentials = 7107,
  BackendInternalServerError = 7110,
  BackendEmptyAppUserId = 7220,
  BackendInvalidAuthToken = 7224,
  BackendInvalidAPIKey = 7225,
  BackendBadRequest = 7226,
  BackendPlayStoreQuotaExceeded = 7229,
  BackendPlayStoreInvalidPackageName = 7230,
  BackendPlayStoreGenericError = 7231,
  BackendUserIneligibleForPromoOffer = 7232,
  BackendInvalidAppleSubscriptionKey = 7234,
  BackendInvalidSubscriberAttributes = 7263,
  BackendInvalidSubscriberAttributesBody = 7264,
  BackendProductIDsMalformed = 7662,
  BackendAlreadySubscribedError = 7772,
  BackendOfferNotFound = 7814,
  BackendNoMXRecordsFound = 7834,
}

/**
 * Error class for Purchases SDK. You should handle these errors and react
 * accordingly in your app.
 * @public
 */
class PurchasesError extends Error {
  /** @internal */
  static getForBackendError(
    backendErrorCode: BackendErrorCode,
    backendErrorMessage: string | null,
  ): PurchasesError {
    const errorCode = ErrorCodeUtils.getErrorCodeForBackendErrorCode(
      backendErrorCode,
    );
    return new PurchasesError(
      errorCode,
      ErrorCodeUtils.getPublicMessage(errorCode),
      backendErrorMessage,
    );
  }

  constructor(
    /**
     * Error code for the error. This is useful to appropriately react to
     * different error situations.
     */
    public readonly errorCode: ErrorCode,
    /**
     * Message for the error. This is useful for debugging and logging.
     */
    message?: string,
    /**
     * Underlying error message. This provides more details on the error and
     * can be useful for debugging and logging.
     */
    public readonly underlyingErrorMessage?: string | null,
  ) {
    super(message);
  }

  toString = (): string => {
    return `PurchasesError(code: ${
      ErrorCode[this.errorCode]
    }, message: ${this.message})`;
  };
}

export interface SubscriberEntitlementResponse {
  expires_date: string | null;
  grace_period_expires_date?: string | null;
  product_identifier: string;
  product_plan_identifier?: string | null;
  purchase_date: string;
}

export interface SubscriberSubscriptionResponse {
  auto_resume_date?: string | null;
  billing_issues_detected_at: string | null;
  expires_date: string | null;
  grace_period_expires_date?: string | null;
  is_sandbox: boolean;
  original_purchase_date: string;
  period_type: PeriodType;
  product_plan_identifier?: string | null;
  purchase_date: string;
  refunded_at?: string | null;
  store: Store;
  store_transaction_id?: string | null;
  unsubscribe_detected_at: string | null;
}

export interface NonSubscriptionResponse {
  id: string;
  is_sandbox: boolean;
  original_purchase_date: string;
  purchase_date?: string | null;
  store: Store;
  store_transaction_id?: string | null;
}

export interface SubscriberInnerResponse {
  entitlements: { [entitlementId: string]: SubscriberEntitlementResponse };
  first_seen: string;
  last_seen?: string | null;
  management_url: string | null;
  non_subscriptions: { [key: string]: NonSubscriptionResponse[] };
  original_app_user_id: string;
  original_application_version: string | null;
  original_purchase_date: string | null;
  other_purchases?: { [key: string]: unknown } | null; // TODO: Add proper types
  subscriptions: { [productId: string]: SubscriberSubscriptionResponse };
}

export interface SubscriberResponse {
  request_date: string;
  request_date_ms: number;
  subscriber: SubscriberInnerResponse;
}

/**
 * The store where the user originally subscribed.
 * @public
 */
type Store =
  | "app_store"
  | "mac_app_store"
  | "play_store"
  | "amazon"
  | "stripe"
  | "rc_billing"
  | "promotional"
  | "unknown";

/**
 * Supported period types for an entitlement.
 * - "normal" If the entitlement is not under an introductory or trial period.
 * - "intro" If the entitlement is under an introductory period.
 * - "trial" If the entitlement is under a trial period.
 * @public
 */
type PeriodType = "normal" | "intro" | "trial";

/**
 * This object gives you access to all the information about the status
 * of a user's entitlements.
 * @public
 */
interface EntitlementInfo {
  /**
   * The entitlement identifier configured in the RevenueCat dashboard.
   */
  readonly identifier: string;
  /**
   * True if the user has access to the entitlement.
   */
  readonly isActive: boolean;
  /**
   * True if the underlying subscription is set to renew at the end of the
   * billing period (expirationDate). Will always be True if entitlement is
   * for lifetime access.
   */
  readonly willRenew: boolean;
  /**
   * The store where this entitlement was unlocked from.
   */
  readonly store: Store;
  /**
   * The latest purchase or renewal date for the entitlement.
   */
  readonly latestPurchaseDate: Date;
  /**
   * The first date this entitlement was purchased.
   */
  readonly originalPurchaseDate: Date;
  /**
   * The expiration date for the entitlement, can be `null` for lifetime
   * access. If the {@link EntitlementInfo.periodType} is `trial`, this is the trial
   * expiration date.
   */
  readonly expirationDate: Date | null;
  /**
   * The product identifier that unlocked this entitlement.
   */
  readonly productIdentifier: string;
  /**
   * The date an unsubscribe was detected. Can be `null`.
   * Note: Entitlement may still be active even if user has unsubscribed.
   * Check the {@link EntitlementInfo.isActive} property.
   */
  readonly unsubscribeDetectedAt: Date | null;
  /**
   * The date a billing issue was detected. Can be `null` if there is
   * no billing issue or an issue has been resolved. Note: Entitlement may
   * still be active even if there is a billing issue.
   * Check the `isActive` property.
   */
  readonly billingIssueDetectedAt: Date | null;
  /**
   * False if this entitlement is unlocked via a production purchase.
   */
  readonly isSandbox: boolean;
  /**
   * The last period type this entitlement was in.
   */
  readonly periodType: PeriodType;
}

/**
 * Contains all the entitlements associated to the user.
 * @public
 */
interface EntitlementInfos {
  /**
   * Map of all {@link EntitlementInfo} objects (active and inactive) keyed by
   * entitlement identifier.
   */
  readonly all: { [entitlementId: string]: EntitlementInfo };
  /**
   * Dictionary of active {@link EntitlementInfo} keyed by entitlement identifier.
   */
  readonly active: { [entitlementId: string]: EntitlementInfo };
}

/**
 * Type containing all information regarding the customer.
 * @public
 */
export interface CustomerInfo {
  /**
   * Entitlements attached to this customer info.
   */
  readonly entitlements: EntitlementInfos;
  /**
   * Map of productIds to expiration dates.
   */
  readonly allExpirationDatesByProduct: {
    [productIdentifier: string]: Date | null;
  };

  /**
   * Map of productIds to expiration dates.
   */
  readonly allExpirationDates: {
    [productIdentifier: string]: Date | null;
  };
  /**
   * Map of productIds to purchase dates.
   */
  readonly allPurchaseDatesByProduct: {
    [productIdentifier: string]: Date | null;
  };

  /**
   * Lsit of productIds.
   */
  readonly allPurchasedProductIdentifiers: string[];

  /**
   * Lsit of productIds.
   */
  readonly nonSubscriptionTransactions: string[];

  /**
   * Map of productIds to purchase dates.
   */
  readonly allPurchaseDates: {
    [productIdentifier: string]: Date | null;
  };
  /**
   * Set of active subscription product identifiers.
   */
  readonly activeSubscriptions: string[];
  /**
   * URL to manage the active subscription of the user.
   * If this user has an active RC Billing subscription, a link to the management page.
   * If this user has an active iOS subscription, this will point to the App Store.
   * If the user has an active Play Store subscription it will point there.
   * If there are no active subscriptions it will be null.
   */
  readonly managementURL: string | null;
  /**
   * Date when this info was requested.
   */
  readonly requestDate: Date;
  /**
   * The date this user was first seen in RevenueCat.
   */
  readonly firstSeen: Date;
  /**
   * The purchase date for the version of the application when the user bought the app.
   * Use this for grandfathering users when migrating to subscriptions. This can be null.
   */
  readonly originalPurchaseDate: Date | null;
  /**
   * The original App User Id recorded for this user.
   */
  readonly originalAppUserId: string;
}

function isActive(
  entitlementInfoResponse: SubscriberEntitlementResponse,
): boolean {
  if (entitlementInfoResponse.expires_date == null) return true;
  const expirationDate = new Date(entitlementInfoResponse.expires_date);
  const currentDate = new Date();
  return expirationDate > currentDate;
}

function toEntitlementInfo(
  entitlementIdentifier: string,
  entitlementInfoResponse: SubscriberEntitlementResponse,
  subscriptions: { [productId: string]: SubscriberSubscriptionResponse },
  latestNonSubscriptionPurchaseByProduct: {
    [key: string]: NonSubscriptionResponse;
  },
): EntitlementInfo {
  const productIdentifier = entitlementInfoResponse.product_identifier;
  if (productIdentifier in subscriptions) {
    return toSubscriptionEntitlementInfo(
      entitlementIdentifier,
      entitlementInfoResponse,
      subscriptions[productIdentifier],
    );
  } else if (productIdentifier in latestNonSubscriptionPurchaseByProduct) {
    return toNonSubscriptionEntitlementInfo(
      entitlementIdentifier,
      entitlementInfoResponse,
      latestNonSubscriptionPurchaseByProduct[productIdentifier],
    );
  }
  throw new PurchasesError(
    ErrorCode.CustomerInfoError,
    "Could not find entitlement product in subscriptions or non-subscriptions.",
  );
}

function toSubscriptionEntitlementInfo(
  entitlementIdentifier: string,
  entitlementInfoResponse: SubscriberEntitlementResponse,
  subscriptionResponse: SubscriberSubscriptionResponse | null,
): EntitlementInfo {
  return {
    identifier: entitlementIdentifier,
    isActive: isActive(entitlementInfoResponse),
    willRenew: getWillRenew(entitlementInfoResponse, subscriptionResponse),
    store: subscriptionResponse?.store ?? "unknown",
    latestPurchaseDate: new Date(entitlementInfoResponse.purchase_date),
    originalPurchaseDate: new Date(entitlementInfoResponse.purchase_date),
    expirationDate: toDateIfNotNull(entitlementInfoResponse.expires_date),
    productIdentifier: entitlementInfoResponse.product_identifier,
    unsubscribeDetectedAt: toDateIfNotNull(
      subscriptionResponse?.unsubscribe_detected_at,
    ),
    billingIssueDetectedAt: toDateIfNotNull(
      subscriptionResponse?.billing_issues_detected_at,
    ),
    isSandbox: subscriptionResponse?.is_sandbox ?? false,
    periodType: subscriptionResponse?.period_type ?? "normal",
  };
}

function toNonSubscriptionEntitlementInfo(
  entitlementIdentifier: string,
  entitlementInfoResponse: SubscriberEntitlementResponse,
  nonSubscriptionResponse: NonSubscriptionResponse,
): EntitlementInfo {
  return {
    identifier: entitlementIdentifier,
    isActive: true,
    willRenew: false,
    store: nonSubscriptionResponse.store,
    latestPurchaseDate: new Date(entitlementInfoResponse.purchase_date),
    originalPurchaseDate: new Date(
      nonSubscriptionResponse.original_purchase_date,
    ),
    expirationDate: null,
    productIdentifier: entitlementInfoResponse.product_identifier,
    unsubscribeDetectedAt: null,
    billingIssueDetectedAt: null,
    isSandbox: nonSubscriptionResponse.is_sandbox,
    periodType: "normal",
  };
}

function toEntitlementInfos(
  entitlementsResponse: {
    [entitlementId: string]: SubscriberEntitlementResponse;
  },
  subscriptions: { [productId: string]: SubscriberSubscriptionResponse },
  latestNonSubscriptionPurchaseByProduct: {
    [key: string]: NonSubscriptionResponse;
  },
): EntitlementInfos {
  const allEntitlementInfo: { [entitlementId: string]: EntitlementInfo } = {};
  const activeEntitlementInfo: { [entitlementId: string]: EntitlementInfo } =
    {};
  for (const key in entitlementsResponse) {
    const entitlementInfo = toEntitlementInfo(
      key,
      entitlementsResponse[key],
      subscriptions,
      latestNonSubscriptionPurchaseByProduct,
    );
    allEntitlementInfo[key] = entitlementInfo;
    if (entitlementInfo.isActive) {
      activeEntitlementInfo[key] = entitlementInfo;
    }
  }
  return {
    all: allEntitlementInfo,
    active: activeEntitlementInfo,
  };
}

function toDateIfNotNull(value: string | undefined | null): Date | null {
  if (value == null) return null;
  return new Date(value);
}

export function toCustomerInfo(
  customerInfoResponse: SubscriberResponse,
): CustomerInfo {
  const expirationDatesByProductId = getExpirationDatesByProductId(
    customerInfoResponse,
  );
  const subscriberResponse = customerInfoResponse.subscriber;

  const latestNonSubscriptionPurchaseByProduct =
    getLatestNonSubscriptionPurchaseByProduct(
      subscriberResponse.non_subscriptions,
    );
  return {
    entitlements: toEntitlementInfos(
      subscriberResponse.entitlements,
      subscriberResponse.subscriptions,
      latestNonSubscriptionPurchaseByProduct,
    ),
    allExpirationDatesByProduct: expirationDatesByProductId,
    allPurchaseDatesByProduct: getPurchaseDatesByProductId(
      customerInfoResponse,
      latestNonSubscriptionPurchaseByProduct,
    ),
    allExpirationDates: expirationDatesByProductId,
    allPurchaseDates: getPurchaseDatesByProductId(
      customerInfoResponse,
      latestNonSubscriptionPurchaseByProduct,
    ),
    nonSubscriptionTransactions: [],
    allPurchasedProductIdentifiers: [],
    activeSubscriptions: getActiveSubscriptions(expirationDatesByProductId),
    managementURL: subscriberResponse.management_url,
    requestDate: new Date(customerInfoResponse.request_date),
    firstSeen: new Date(subscriberResponse.first_seen),
    originalPurchaseDate: toDateIfNotNull(
      subscriberResponse.original_purchase_date,
    ),
    originalAppUserId: customerInfoResponse.subscriber.original_app_user_id,
  };
}

function getWillRenew(
  entitlementInfoResponse: SubscriberEntitlementResponse,
  subscriptionResponse: SubscriberSubscriptionResponse | null,
) {
  if (subscriptionResponse == null) return false;
  const isPromo = subscriptionResponse.store == "promotional";
  const isLifetime = entitlementInfoResponse.expires_date == null;
  const hasUnsubscribed = subscriptionResponse.unsubscribe_detected_at != null;
  const hasBillingIssues =
    subscriptionResponse.billing_issues_detected_at != null;
  return !(isPromo || isLifetime || hasUnsubscribed || hasBillingIssues);
}

function getPurchaseDatesByProductId(
  customerInfoResponse: SubscriberResponse,
  latestNonSubscriptionPurchaseByProduct: {
    [key: string]: NonSubscriptionResponse;
  },
): { [productId: string]: Date | null } {
  const purchaseDatesByProduct: { [productId: string]: Date | null } = {};
  for (const subscriptionId in customerInfoResponse.subscriber.subscriptions) {
    const subscription =
      customerInfoResponse.subscriber.subscriptions[subscriptionId];
    purchaseDatesByProduct[subscriptionId] = new Date(
      subscription.purchase_date,
    );
  }
  for (const productId in latestNonSubscriptionPurchaseByProduct) {
    const purchaseDate =
      latestNonSubscriptionPurchaseByProduct[productId].purchase_date;
    if (purchaseDate == null) {
      purchaseDatesByProduct[productId] = null;
    } else {
      purchaseDatesByProduct[productId] = new Date(purchaseDate);
    }
  }
  return purchaseDatesByProduct;
}

function getExpirationDatesByProductId(
  customerInfoResponse: SubscriberResponse,
): { [productId: string]: Date | null } {
  const expirationDatesByProduct: { [productId: string]: Date | null } = {};
  for (const subscriptionId in customerInfoResponse.subscriber.subscriptions) {
    const subscription =
      customerInfoResponse.subscriber.subscriptions[subscriptionId];
    if (subscription.expires_date == null) {
      expirationDatesByProduct[subscriptionId] = null;
    } else {
      expirationDatesByProduct[subscriptionId] = new Date(
        subscription.expires_date,
      );
    }
  }
  return expirationDatesByProduct;
}

function getActiveSubscriptions(expirationDatesByProductId: {
  [productId: string]: Date | null;
}): string[] {
  const activeSubscriptions: Set<string> = new Set();
  const currentDate = new Date();
  for (const productId in expirationDatesByProductId) {
    const expirationDate = expirationDatesByProductId[productId];
    if (expirationDate == null) {
      activeSubscriptions.add(productId);
    } else if (expirationDate > currentDate) {
      activeSubscriptions.add(productId);
    }
  }
  return Array.from(activeSubscriptions);
}

function getLatestNonSubscriptionPurchaseByProduct(nonSubscriptions: {
  [key: string]: NonSubscriptionResponse[];
}): { [key: string]: NonSubscriptionResponse } {
  const latestNonSubscriptionPurchaseByProduct: {
    [key: string]: NonSubscriptionResponse;
  } = {};
  for (const key in nonSubscriptions) {
    if (nonSubscriptions[key].length === 0) continue;
    const numberPurchases = nonSubscriptions[key].length;
    latestNonSubscriptionPurchaseByProduct[key] =
      nonSubscriptions[key][numberPurchases - 1];
  }
  return latestNonSubscriptionPurchaseByProduct;
}
