.PHONY: test

iex:
	iex -S mix phx.server

lint:
	mix do format, lint

migrate:
	mix do compile, efex.migrate

migrate-cmw:
	mix ecto.migrate -r Efex.Repo

rollback:
	mix ecto.rollback

migration:
	@while [ -z "$$MIGRATION_NAME" ]; do \
		read -r -p "Enter Migration Name: " MIGRATION_NAME; \
	done ; \
	mix ecto.gen.migration "$$MIGRATION_NAME" -r Efex.Repo
