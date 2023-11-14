# Terraform Provider OpenAPI Scaffolding

This is a [Cookiecutter](https://github.com/cookiecutter/cookiecutter) template for scaffolding new Terraform providers that are automatically generated from an OpenAPI specification.

[![Build Status](https://github.com/squat/terraform-provider-openapi-scaffolding/workflows/CI/badge.svg)](https://github.com/squat/terraform-provider-openapi-scaffolding/actions?query=workflow%3ACI)

## Getting Started

In order to render a new provider from the template, `cookiecutter` must be installed.
Optionally, [`cruft`](https://github.com/cruft/cruft) can be installed to enable automatically updating the provider from the template.
Assuming, `cruft` is available, a new Terraform provider can be rendered with:
```sh
cruft create git@github.com:squat/terraform-provider-openapi-scaffolding.git << EOF
your_github_username
CloudProviderName
https://cloud.provider.website.example.com
https://cloud.provider.website.example.com/openapi-specification.yaml

EOF
```

Once the template has rendered, change into to the newly created directory:
```sh
cd terraform-provider-cloudprovidername
```

Next, edit the `patch.sh` file to annotate the API operations with the necessary [Speakeasy tags](https://www.speakeasyapi.dev/docs/create-terraform#how-it-works-adding-annotations).
Finally, export the Speakeasy API key and generate the provider:
```sh
export SPEAKEASY_API_KEY=<your_speakeasy_api_key>
make generate
```

That's it!
You now have a working Terraform provider.

## Testing

To test the newly generated provider, navigate to the root of the provider repository and run:
```sh
go run main.go --debug
```

This command will output a `TF_REATTACH_PROVIDERS` environment variable; copy it and navigate to a new directory containing Terraform configuration that leverages the provider.
Now, initialize and apply the Terraform configuration:
```sh
TF_REATTACH_PROVIDERS=... terraform init
TF_REATTACH_PROVIDERS=... terraform apply
```

## Publishing

The provider can now be tagged and pushed to a GitHub repository.
Releases are automated using GitHub actions: a new GitHub release will automatically be created for every Git tag that is found in the repository.
The following secrets must be set in the GitHub repository:
* `GPG_PRIVATE_KEY`;
* `PASSPHRASE`; and
* `SPEAKEASY_API_KEY`.

See the [Terraform providers documentation](https://developer.hashicorp.com/terraform/registry/providers/publishing) for instructions on generating a GPG key and passphrase and create a [Speakeasy](https://www.speakeasyapi.dev/) account in order to generate an API key.
