agnoster
========

A prompt theme based on the Powerline-inspired [original agnoster] theme,
on the [ohmyzsh version of agnoster] and on the deprecated [Powerlevel9k] theme.

<img width="706" src="https://zimfw.github.io/images/prompts/eriner@2.png">

What does it show?
------------------

  * Status segment:
    * Exit code when there was an error.
    * `⚡` when you're root.
    * `⚙` when there are background jobs.
    * Python [venv] indicator.
    * `username@hostname` when in a ssh session.
  * Working directory segment.
  * Git segment (background color varies if working tree is clean or dirty):
    * Current branch name, or commit short hash when in ['detached HEAD' state].
    * `↑` and/or `↓` with respective count when there are commits ahead and/or
      behind of remote.
    * `⍟` with count when there are stashed states.
    * `✚` when there are staged files.
    * `●` when there are modified files.
    * Git action, when there's an operation in progress.

Advanced settings
-----------------

You can customize how the current working directory is shown with the
[prompt-pwd module settings].

The git indicators can be customized by changing the following git-info module
context formats:

| Context name | Description                   | Default format |
| ------------ | ----------------------------- | -------------- |
| branch       | Branch name                   | ` %b`         |
| commit       | Commit short hash             | `➦ %c`         |
| ahead        | Commits ahead of remote count | ` ↑%A`         |
| behind       | Commits behind remote count   | ` ↓%B`         |
| stashed      | Stashed states count          | ` ⍟%S`         |
| indexed      | Indexed files                 | ` ✚`           |
| unindexed    | Unindexed files               | ` ●`           |
| action       | Special action name           | `  %s`        |
| clean        | Clean state                   | `green`        |
| dirty        | Dirty state                   | `yellow`       |

Use the following command to override a git-info context format:

    zstyle ':zim:git-info:<context_name>' format '<new_format>'

For detailed information about these and other git-info settings, check the
[git-info documentation].

These advanced settings must be overridden after the theme is initialized.

Requirements
------------

In order for this theme to render correctly, a font with Powerline symbols is
required. A simple way to install a font with Powerline symbols is to follow the
[instructions here]. In addition, it looks better with the [Solarized theme].

Requires zimfw's [prompt-pwd] module to show the current working directory, and
[git-info] to show git information.

[original agnoster]: https://github.com/agnoster/agnoster-zsh-theme
[ohmyzsh version of agnoster]: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/agnoster.zsh-theme
[Powerlevel9k]: https://github.com/bhilburn/powerlevel9k
[venv]: https://docs.python.org/3/library/venv.html
['detached HEAD' state]: https://git-scm.com/docs/git-checkout#_detached_head
[prompt-pwd module settings]: https://github.com/zimfw/prompt-pwd/blob/master/README.md#settings
[git-info documentation]: https://github.com/zimfw/git-info/blob/master/README.md#settings
[instructions here]: https://github.com/powerline/fonts/blob/master/README.rst#installation
[Solarized theme]: https://github.com/altercation/solarized
[prompt-pwd]: https://github.com/zimfw/prompt-pwd
[git-info]: https://github.com/zimfw/git-info

