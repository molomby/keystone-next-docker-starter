# Keystone Next on Docker

A Keystone Next example/starter project for Docker-based deployments.

**TODO: Intro text**

## App Features

The app Keystone schema is a mix of the Keystone Next
[todo](https://github.com/keystonejs/keystone/tree/master/examples/todo) and
[auth](https://github.com/keystonejs/keystone/tree/master/examples/auth) example projects.
It demos a number of Keystone features, including:

- Some lists to play around with
- Password based authentication
- Stateless sessions
- Initial user creation workflow
- Admin UI
- GraphQL endpoint (`/api/graphql`), inc. GraphiQL (when `NODE_ENV !== 'production'`)
- Access control
- Automatic migrations (via. [Prisma Migrate](https://www.prisma.io/docs/concepts/components/prisma-migrate))

## Local Dev

**TODO: Local dev instructions**

## Deployments

**TODO: Deployment instructions**

### Migrations

The first time you run `yarn dev` locally Keystone will create a local development database with the initial schema.

To extend this database schema, simply make your changes to the Keystone lists in `schema.ts` and re-run `yarn dev`.
Keystone will detect these changes, prompt you to create a migration and apply the changes to your local database.
Eg:

```
✨ There has been a change to your Keystone schema that requires a migration

✔ Name of migration … Adding person.country field
✨ A migration has been created at migrations/20210514023215_adding_person_country_field
✔ Would you like to apply this migration? … yes
✅ The migration has been applied
```

Your changes will then be reflected in the Admin UI and GraphQL API.

Behind the scenes, this magic is being performed by
[Prisma](https://www.prisma.io) and [Prisma Migrate](https://www.prisma.io/docs/concepts/components/prisma-migrate)
which generates SQL migration scripts based on your code changes.
You can find these files in the `/migrations` directory.

Committing these migration scripts to GitHub will cause the migration to be run when your app is next deployed.
Adding your own SQL scripts to the directory will also work, just follow the directory naming convention –
migrations are applied based on their order on disk.
This can be useful for importing data or DB operations beyond the scope of Keystone.

### Seed Data

The ability to add arbitrary SQL migrations lets you seed data into your database somewhat easily.
Create a SQL file with some insert commands and place it in an appropriately named directory within `/migrations`.

Data added in this way will be applied to any databases created when a new collaborator clones the repo and first runs `yarn dev`.
Having a fake but realistic set of data, automatically inserted when a DB is created, can also be very useful for automated testing.

## KeystoneJS

Keystone is a powerful GraphQL based headless CMS.
Written in TypeScript, it has some terrific features out of the box, is easy to extend and a joy to use.

This app is build on an early preview build of Keystone Next.
We have some exciting plans for the project, with lots of features and docs rolling out over the next few months, as we move toward production readiness.
If you want to know more
checkout the (preview) [Keystone Next docs](https://next.keystonejs.com),
fork us on [GitHub](https://github.com/keystonejs/keystone)
or join the [KeystoneJS Slack](https://keystonejs.slack.com).
