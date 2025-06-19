# Sequin Outbox Demo

## Run project

```shell
docker compose up --detach --remove-orphans --wait
```

## Insert some messages to outbox

```shell
docker compose exec postgres \
  psql -U postgres -d app -c \
  "insert into outbox (message_id, message) \
   select gen_random_uuid(), json_build_object('payload', x) \
   from generate_series(1, 20) as x"
```

## Learn more

- [Sequin docs](https://sequinstream.com/docs/quickstart/rabbitmq)
