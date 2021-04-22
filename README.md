To reproduce the issue:

1. Clone the repository
2. `yarn`
3. `yarn start` to start a Ganache node
4. `yarn migrate` to compile and migrate contract
5. `yarn profile` to profile

Last command should lead to this error:

```
TypeError: Cannot read property 'split' of undefined
    at Object.parseSourceMap (/mnt/Data/Downloads/dev-tools-truffle-example/node_modules/@0x/sol-tracing-utils/src/source_maps.ts:53:28)
    at TraceCollector.<anonymous> (/mnt/Data/Downloads/dev-tools-truffle-example/node_modules/@0x/sol-tracing-utils/src/trace_collector.ts:106:33)
    at Generator.next (<anonymous>)
    at fulfilled (/mnt/Data/Downloads/dev-tools-truffle-example/node_modules/@0x/sol-tracing-utils/lib/src/trace_collector.js:5:58)
```

Now, if:

1. you set `solcVersion` to `0.7.5+commit.eb77ed08` in `truffle-config.js`,
2. you remove `.0x-artifacts` and `build` folders,
3. you run `yarn profile` again,

you should not have any error.
