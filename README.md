# Tools - GIMP

David Williamson @ Varilink Computing Ltd

------

Tool for using GIMP batch mode to generate images that are transformed from source image files in website projects. Projects that use this tool can define and track the source image files and the GIMP Script-Fu script file or files that are run in order to generate their distribution images. They do not then need to track those distribution images.

## Using this tool

### Install

To install this tool in projects, add it as a Git submodule with the submodule path tools/gimp. The tool is implemented as a Docker Compose service. Add the path to its `docker-compose.yml` file to the paths defined by the `COMPOSE_FILE` Docker Compose environment variable in the project's Docker Compose `.env` file.

In the project's master `docker-compose.yml` file you must then extend the `gimp` service provided by this tool so that the `.scm` script or scripts that you want to execute are in the `/gimp` folder for that service's containers. You also need to map the source images and the location(s) for distribution images into the container, exactly where is dictated by your `.scm` script or scripts.

### Run

You can then run this tool from the root folder of your project, either without any command arguments:

```bash
docker-compose run --rm gimp
```

In which case it will run every `.scm` file within the folder that you mapped to `/gimp` in the container.

Or, you can specify one or more `.scm` scripts that are located in the same folder, omitting the file extension; for example:

```bash
docker-compose run --rm gimp theme library
```

That example will run the `theme.scm` and `library.scm` scripts, if they are present in the folder that you mapped to `/gimp` in the container.

### Examples

Here are some of my repositories that use this tool:

- [Website - Ansible](https://github.com/varilink/website-ansible)
