import "./models.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.Workloads;
/**
 * Define the Virtual Instance for SAP solutions resource.
 */
#suppress "@azure-tools/typespec-azure-core/casing-style" "SAP is used for representing the company product."
model SAPVirtualInstance is TrackedResource<SAPVirtualInstanceProperties> {
  ...ResourceNameParameter<
    Resource = SAPVirtualInstance,
    KeyName = "sapVirtualInstanceName",
    SegmentName = "sapVirtualInstances",
    NamePattern = "^[a-zA-Z][a-zA-Z0-9]{2}$"
  >;
  ...SAPVirtualInstanceIdentityProperty;
}

#suppress "@azure-tools/typespec-azure-core/casing-style" "SAP is used for representing the company product."
@armResourceOperations
interface SAPVirtualInstances {
  /**
   * Gets a Virtual Instance for SAP solutions resource
   */
  get is ArmResourceRead<SAPVirtualInstance>;

  /**
   * Creates a Virtual Instance for SAP solutions (VIS) resource
   */
  create is ArmResourceCreateOrReplaceAsync<SAPVirtualInstance>;

  /**
   * Updates a Virtual Instance for SAP solutions resource
   */
  @patch(#{ implicitOptionality: false })
  update is ArmCustomPatchAsync<
    SAPVirtualInstance,
    UpdateSAPVirtualInstanceRequest
  >;

  /**
   * Deletes a Virtual Instance for SAP solutions resource and its child resources, that is the associated Central Services Instance, Application Server Instances and Database Instance.
   */
  delete is ArmResourceDeleteWithoutOkAsync<SAPVirtualInstance>;

  /**
   * Gets all Virtual Instances for SAP solutions resources in a Resource Group.
   */
  listByResourceGroup is ArmResourceListByParent<SAPVirtualInstance>;

  /**
   * Gets all Virtual Instances for SAP solutions resources in a Subscription.
   */
  listBySubscription is ArmListBySubscription<SAPVirtualInstance>;

  /**
   * Starts the SAP application, that is the Central Services instance and Application server instances.
   */
  start is CustomizedArmResourceActionAsync<
    SAPVirtualInstance,
    StartRequest,
    Foundations.OperationStatusResult
  >;

  /**
   * Stops the SAP Application, that is the Application server instances and Central Services instance.
   */
  stop is CustomizedArmResourceActionAsync<
    SAPVirtualInstance,
    StopRequest,
    Foundations.OperationStatusResult
  >;

  /**
   * Gets the sizing recommendations.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "Added Operation ID as it determines the PowerShell verb used."
  @operationId("SapVirtualInstances_InvokeSizingRecommendations")
  getSizingRecommendations is VirtualResourceActionSync<
    SAPVirtualInstanceMetadata,
    SAPSizingRecommendationRequest,
    SAPSizingRecommendationResult
  >;

  /**
   * Get a list of SAP supported SKUs for ASCS, Application and Database tier.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "Added Operation ID as it determines the PowerShell verb used."
  @operationId("SapVirtualInstances_InvokeSapSupportedSku")
  getSapSupportedSku is VirtualResourceActionSync<
    SAPVirtualInstanceMetadata,
    SAPSupportedSkusRequest,
    SAPSupportedResourceSkusResult
  >;

  /**
   * Get the SAP Disk Configuration Layout prod/non-prod SAP System.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "Added Operation ID as it determines the PowerShell verb used."
  @operationId("SapVirtualInstances_InvokeDiskConfigurations")
  getDiskConfigurations is VirtualResourceActionSync<
    SAPVirtualInstanceMetadata,
    SAPDiskConfigurationsRequest,
    SAPDiskConfigurationsResult
  >;

  /**
   * Get the recommended SAP Availability Zone Pair Details for your region.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "Added Operation ID as it determines the PowerShell verb used."
  @operationId("SapVirtualInstances_InvokeAvailabilityZoneDetails")
  getAvailabilityZoneDetails is VirtualResourceActionSync<
    SAPVirtualInstanceMetadata,
    SAPAvailabilityZoneDetailsRequest,
    SAPAvailabilityZoneDetailsResult
  >;
}

@@doc(SAPVirtualInstance.name,
  "The name of the Virtual Instances for SAP solutions resource"
);
@@doc(SAPVirtualInstances.create::parameters.resource,
  "Virtual Instance for SAP solutions resource request body."
);
@@doc(SAPVirtualInstances.update::parameters.properties,
  "Request body to update a Virtual Instance for SAP solutions resource."
);
@@doc(SAPVirtualInstances.start::parameters.body,
  "The Virtual Instance for SAP solutions resource start request body."
);
@@doc(SAPVirtualInstances.stop::parameters.body,
  "The Virtual Instance for SAP solutions resource stop request body."
);
