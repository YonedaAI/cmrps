-- | Entry point for the vol-01-foundations executable taxonomy layer.
-- Runs the instance demonstrations of "Instances". Computational evidence
-- only; nothing here is proof and nothing here is verified by Lean.
module Main (main) where

import Vol01Foundations.Instances (demo)

main :: IO ()
main = demo
