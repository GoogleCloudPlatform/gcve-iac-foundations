# VMWare vSphere VM Terraform Module
This Terraform module creates VMs in vSphere

# Execution environment
The vCenter user must have administrator privileges, in GCVE will require to use the [elevate privileges feature](https://cloud.google.com/vmware-engine/docs/private-clouds/howto-elevate-privilege).


<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | >= 2.0.2 |

## Usage
Basic usage of this module is as follows:

```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 cluster  = 
	 datacenter  = 
	 datastore  = 
	 folder  = 
	 guest_os_type  = 
	 network  = 
	 num_cpu  = 
	 num_memory  = 
	 resource_pool  = 
	 vm_name  = 

	 # Optional variables
	 annotation  = "Terraform-managed VM"
	 cdrom_path  = ""
	 default_storage_policy_id  = "vSAN Default Storage Policy"
	 disks  = {}
}
```

## Resources

| Name | Type |
|------|------|
| [vsphere_virtual_machine.vsphere_vm](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine) | resource |
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/compute_cluster) | data source |
| [vsphere_datacenter.datacenter](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter) | data source |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_network.network](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_resource_pool.resource_pool](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/resource_pool) | data source |
| [vsphere_storage_policy.default_storage_policy](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/storage_policy) | data source |
| [vsphere_storage_policy.storage_policy](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/storage_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_annotation"></a> [annotation](#input\_annotation) | User-provided description of the VM | `string` | `"Terraform-managed VM"` | no |
| <a name="input_cdrom_path"></a> [cdrom\_path](#input\_cdrom\_path) | Single CD-ROM device path to be attached to the VM | `string` | `""` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Cluster name where the VM will be located | `string` | n/a | yes |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | Datacenter name where the VM will be located | `string` | n/a | yes |
| <a name="input_datastore"></a> [datastore](#input\_datastore) | Datastore name where the VM will be located | `string` | n/a | yes |
| <a name="input_default_storage_policy_id"></a> [default\_storage\_policy\_id](#input\_default\_storage\_policy\_id) | Default Storage Policy ID | `string` | `"vSAN Default Storage Policy"` | no |
| <a name="input_disks"></a> [disks](#input\_disks) | Virtual disks assigned to the VM | <pre>map(object({<br>    size             = number<br>    thin_provisioned = bool<br>    unit_number      = number<br>    storage_policy   = string<br>  }))</pre> | `{}` | no |
| <a name="input_folder"></a> [folder](#input\_folder) | Folder name where the VM will be located | `string` | n/a | yes |
| <a name="input_guest_os_type"></a> [guest\_os\_type](#input\_guest\_os\_type) | The guest ID for the operating system | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The managed object reference ID of the network on which to connect the virtual machine network interface | `string` | n/a | yes |
| <a name="input_num_cpu"></a> [num\_cpu](#input\_num\_cpu) | The number of virtual processors to assign to the VM | `number` | n/a | yes |
| <a name="input_num_memory"></a> [num\_memory](#input\_num\_memory) | The size of the virtual machine's memory, in MB | `number` | n/a | yes |
| <a name="input_resource_pool"></a> [resource\_pool](#input\_resource\_pool) | Resource pool name where the VM will be assigned | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | The name of the virtual machine | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vsphere_virtual_machine"></a> [vsphere\_virtual\_machine](#output\_vsphere\_virtual\_machine) | The resource object of the created vSphere VM |

<!-- END_AUTOMATED_TF_DOCS_BLOCK --> 
