# clocGits
A LOC counter for Github repositories
employing [cloc](https://github.com/AlDanial/cloc) and [gitim](https://github.com/muhasturk/gitim).

Uses gitim to clone all repositories accessible by a user (or limits it to a specified organization) and calculates the overall LOC for all cloned repositories.

## Requirements
- Git
- Github Account, optional an organization
- (Python3)

## Installation
`./setup.sh`

## Usage
`./clocGits DOWNLOADFOLDERNAME USERNAME [ORGANIZATIONNAME]`

- `DOWNLOADFOLDERNAME`: the subfolder into the repositories are cloned 
- `USERNAME`: the Github username, a prompt asks for the password 
- `[ORGANIZATIONNAME]`: optional, limits the cloned repositories to the specified organization
