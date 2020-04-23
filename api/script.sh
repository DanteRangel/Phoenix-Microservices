# script.sh

#!/bin/bash
# Docker entrypoint script.

echo "Conect to  $PGDATABASE on $PGHOST"
mix deps.get
echo '====================================================='
echo 'mix deps.get'
mix ecto.create
echo '====================================================='
echo 'mix ecto.create'
mix ecto.migrate
echo '====================================================='
echo 'mix ecto.migrate'
mix run priv/repo/seeds.exs
echo '====================================================='
echo 'mix run priv/repo/seeds.exs'
mix test
echo '====================================================='
echo 'mix test'
echo "Database $PGDATABASE created."

exec mix phx.server