import "./main.tsp";
import "@azure-tools/typespec-client-generator-core";

using Azure.ClientGenerator.Core;

@@clientName(Microsoft.AVS, "AzureVMwareSolutionAPI", "javascript");
@@clientName(Microsoft.AVS, "AVS", "python");
