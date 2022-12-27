#+title: Troubleshooting Guide

# Doom Emacs

## Doom's Troubleshooting Docs
[getting_started.org#troubleshoot](https://github.com/doomemacs/doomemacs/blob/develop/docs/getting_started.org#troubleshoot)

## Partial Issue Checklist
`hlissner` summarized in a comment [here](https://github.com/doomemacs/doomemacs/issues/4273#issuecomment-728637306):

> - Checking if their issue is reproducible [in the sandbox](https://github.com/doomemacs/doomemacs/blob/develop/docs/getting_started.org#testing-in-dooms-sandbox).
> - Making sure they've tried the usual `doom sync && doom build`.
> - Producing backtraces from error messages.
> - Reminding them to include their `M-x doom/info` when they have ignored the issue template.

## Doom's Sandbox
Unfortunately, the sandbox [is largely broken](https://github.com/doomemacs/doomemacs/issues/6505).

## Launch w/ Blank Config
You can launch Doom with a "blank" config by giving it a non-existent $DOOMDIR:

> $ doom run --doomdir /tmp
> $ DOOMDIR=/tmp/does/not/exist emacs
