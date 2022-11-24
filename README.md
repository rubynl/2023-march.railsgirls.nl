# Rails Girls NL website

The website of Rails Girls NL. It can be found at [railsgirls.nl](https://railsgirls.nl).

## Table of Contents

- [Install](#install)
- [Development](#development)
- [Commands](#commands)
- [Deployment](#deployment)
- [Contributing](#contributing)

## Install

```sh
bundle install
yarn install
```

## Development

Start the website in development mode, run the following command and navigate to [localhost:4000](https://localhost:4000/).

```
bin/bridgetown start
```

### Commands

```sh
# Running locally
bin/bridgetown start

# Build & deploy to production
bin/bridgetown deploy

# Load the site up within a Ruby console (IRB)
bin/bridgetown console
```

> Learn more: [Bridgetown CLI Documentation](https://www.bridgetownrb.com/docs/command-line-usage)

## Deployment

You can deploy Bridgetown sites on hosts like Render or Vercel as well as traditional web servers by simply building and copying the output folder to your HTML root.

> Read the [Bridgetown Deployment Documentation](https://www.bridgetownrb.com/docs/deployment) for more information.

## Contributing

1. Fork this repository.
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`).
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.
