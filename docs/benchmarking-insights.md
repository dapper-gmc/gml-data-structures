# Benchmarking Insights

This document details any useful insights derived from implementation and
benchmarking process.

## Lists vs. Arrays
- Arrays seem to be faster than ds\_lists for most purposes, but the difference
  is slight.

## Array Initialization
- By far, the fastest way to create and initialize a (large) array seems to be
  using the array\_create function (with a default value)

- Using array\_create without a default value is as performant as not using
  array\_create at all
