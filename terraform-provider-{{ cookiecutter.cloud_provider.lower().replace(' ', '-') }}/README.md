# {{ cookiecutter.cloud_provider }} Terraform Provider

The Terraform provider for {{ cookiecutter.cloud_provider }} enables the declarative management of resources in [{{ cookiecutter.cloud_provider }}]({{ cookiecutter.cloud_provider_url }}).

[![Build Status](https://github.com/{{ cookiecutter.github_username }}/terraform-provider-{{ cookiecutter.cloud_provider.lower().replace(' ', '-') }}/workflows/CI/badge.svg)](https://github.com/{{ cookiecutter.github_username }}/terraform-provider-{{ cookiecutter.cloud_provider.lower().replace(' ', '-') }}/actions?query=workflow%3ACI)

<!-- Start SDK Installation -->

<!-- End SDK Installation -->



## SDK Example Usage
<!-- Start SDK Example Usage -->

<!-- End SDK Example Usage -->



<!-- Start SDK Available Operations -->

<!-- End SDK Available Operations -->

<!-- Placeholder for Future Speakeasy SDK Sections -->

Terraform allows you to use local provider builds by setting a `dev_overrides` block in a configuration file called `.terraformrc`. This block overrides all other configured installation methods.

Terraform searches for the `.terraformrc` file in your home directory and applies any configuration settings you set.

```
provider_installation {

  dev_overrides {
      "registry.terraform.io/github.com/{{ cookiecutter.github_username }}/terraform-provider-{{ cookiecutter.cloud_provider.lower().replace(' ', '-') }}/scaffolding" = "<PATH>"
  }

  # For all other providers, install them directly from their origin provider
  # registries as normal. If you omit this, Terraform will _only_ use
  # the dev_overrides block, and so no other providers will be available.
  direct {}
}
```

Your `<PATH>` may vary depending on how your Go environment variables are configured. Execute `go env GOBIN` to set it, then set the `<PATH>` to the value returned. If nothing is returned, set it to the default location, `$HOME/go/bin`.

### Generation

This project is generated using [Speakeasy](https://github.com/speakeasy-api/speakeasy).
