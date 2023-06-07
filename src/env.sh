
if [ -n "$POSTGRES_HOST" ]; then
  export POSTGRES_HOST=$POSTGRES_HOST
fi

if [ -n "$POSTGRES_PORT" ]; then
  export POSTGRES_PORT=$POSTGRES_PORT
fi

if [ -n "$POSTGRES_DATABASE" ]; then
  export POSTGRES_DATABASE=$POSTGRES_DATABASE
fi

if [ -n "$POSTGRES_USER" ]; then
  export POSTGRES_USER=$POSTGRES_USER
fi

if [ -n "$POSTGRES_PASSWORD" ]; then
  export POSTGRES_PASSWORD=$POSTGRES_PASSWORD
fi


if [ -n "$S3_ACCESS_KEY_ID" ]; then
  export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
fi
if [ -n "$S3_SECRET_ACCESS_KEY" ]; then
  export AWS_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
fi
export AWS_DEFAULT_REGION=$S3_REGION
export PGPASSWORD=$POSTGRES_PASSWORD



if [ -z "$S3_REGION" ]; then
  echo "You need to set the S3_REGION environment variable."
  exit 1
fi

if [ -z "$S3_BUCKET" ]; then
  echo "You need to set the S3_BUCKET environment variable."
  exit 1
fi


if [ -z "$S3_ENDPOINT" ]; then
  aws_args=""
else
  aws_args="--endpoint-url $S3_ENDPOINT"
fi

if [ -z "$POSTGRES_HOST" ]; then
  # https://docs.docker.com/network/links/#environment-variables
  if [ -n "$POSTGRES_PORT_5432_TCP_ADDR" ]; then
    POSTGRES_HOST=$POSTGRES_PORT_5432_TCP_ADDR
    POSTGRES_PORT=$POSTGRES_PORT_5432_TCP_PORT
  else
    echo "You need to set the POSTGRES_HOST environment variable."
    exit 1
  fi
fi

if [ -z "$POSTGRES_PORT" ]; then
  echo "You need to set the POSTGRES_PORT environment variable."
  exit 1
fi

if [ -z "$POSTGRES_USER" ]; then
  echo "You need to set the POSTGRES_USER environment variable."
  exit 1
fi

if [ -z "$POSTGRES_PASSWORD" ]; then
  echo "You need to set the POSTGRES_PASSWORD environment variable."
  exit 1
fi

if [ -z "$POSTGRES_DATABASE" ]; then
  echo "You need to set the POSTGRES_DATABASE environment variable."
  exit 1
fi

