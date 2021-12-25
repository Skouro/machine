# shellcheck shell=bash

export PATH="$(which aws_completer)/:${PATH}"
complete -C "$(which aws_completer)" aws

function dev_env {
  local code="${1}"

  pushd "${PRODUCT}" \
    && source .envrc* \
    && CACHIX_FLUIDATTACKS_TOKEN= ./m "makes.dev.${code}" \
    && source "out/makes-dev-${code//./-}" \
    && popd
}

function export_fluid_var {
  export "${1}"="$(fetch_fluid_var ${1})"
}

function export_fluid_aws_vars {
  export_fluid_var "PROD_${1^^}_AWS_ACCESS_KEY_ID" \
    && export AWS_ACCESS_KEY_ID="${!var}" \
    && export_fluid_var "PROD_${1^^}_AWS_SECRET_ACCESS_KEY" \
    && export AWS_SECRET_ACCESS_KEY="${!var}"
}
function export_fluid_dev {
  export_fluid_var "DEV_AWS_ACCESS_KEY_ID" \
    && export_fluid_var "DEV_AWS_SECRET_ACCESS_KEY" \
    && export AWS_SECRET_ACCESS_KEY="${DEV_AWS_SECRET_ACCESS_KEY}" \
    && export AWS_ACCESS_KEY_ID="${DEV_AWS_ACCESS_KEY_ID}"
}
function export_fluid_prod {
  export_fluid_var "PROD_MAKES_AWS_ACCESS_KEY_ID" \
    && export_fluid_var "PROD_MAKES_AWS_SECRET_ACCESS_KEY" \
    && export AWS_SECRET_ACCESS_KEY="${PROD_MAKES_AWS_SECRET_ACCESS_KEY}" \
    && export AWS_ACCESS_KEY_ID="${PROD_MAKES_AWS_ACCESS_KEY_ID}"
}

function ol() {
  eval $(
    python3 -m aws_okta_processor authenticate \
      --user "drestrepo@fluidattacks.com" \
      --pass "$OKTA_PASS" \
      --organization "fluidattacks.okta.com" \
      --application "https://fluidattacks.okta.com/home/amazon_aws/0oa9ahz3rfx1SpStS357/272" \
      --silent \
      --duration 32400 \
      --environment
  )
  export DEV_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
  export DEV_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
}

function fetch_fluid_var {
  local url="https://gitlab.com/api/v4/projects/20741933/variables/${1}"

  echo "[INFO] Retrieving var from GitLab: ${1}" 1>&2 \
    && curl -s -H "private-token: ${GITLAB_API_TOKEN}" "${url}" | jq -r '.value'
}

source "${SECRETS}/machine/secrets.sh"
export PATH="/home/${USER}/mutable_node_modules/bin/:$PATH"

export_fluid_dev

if [[ "$(pwd)" == *"product/skims"* ]]; then
  output=skims
  export_fluid_aws_vars skims
  source "${HOME}/.makes/out-dev-${output}/template"
fi

if [[ "$(pwd)" == *"product/integrates"* ]]; then
  pushd "${PRODUCT}"
  output=integratesBack
  export_fluid_aws_vars integrates
  source "${HOME}/.makes/out-dev-${output}/template"
  popd
fi

export DIRENV_WARN_TIMEOUT=1h
