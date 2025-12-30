resource "helm_release" "falco" {
  name = "falco"
  repository = "https://falcosecurity.github.io/charts"
  chart      = "falco"

  set = [
    {
      name  = "falcosidekick.enabled"
      value = "true"
    },
    {
      name  = "falcosidekick.config.aws.kinesis.enabled"
      value = "true"
    },
    {
      name  = "falcosidekick.config.aws.kinesis.streamname"
      value = local.kinesis_stream_name
    },
    {
      name  = "falcosidekick.extraEnv[0].name"
      value = "AWS_ACCESS_KEY_ID"
    },
    {
      name  = "falcosidekick.extraEnv[0].value"
      value = local.falco_access_key
    },
    {
      name  = "falcosidekick.extraEnv[1].name"
      value = "AWS_SECRET_ACCESS_KEY"
    },
    {
      name  = "falcosidekick.extraEnv[1].value"
      value = local.falco_secret_key
    },
    {
      name  = "falcosidekick.extraEnv[2].name"
      value = "AWS_REGION"
    },
    {
      name  = "falcosidekick.extraEnv[2].value"
      value = var.aws_region
    } 
  ]
}