# extract_headers

Extract_headers is a bash tool for automatically extracting headers from all c
files in directory. *extract_headers* supports recursive searching of files so
you do not need to execute it in every directory containing your c files. Files
**MUST** follow the 42 school norm for extraction to work. 

To use *extract_headers*, run the following command. Please note that
*extract_headers*, *create_header* and *colors.sh* must be in the same directory
for this to work.

```bash
./extract_headers --dir path/to/source/files
```

or if you want to extract only one file

```bash
./extract_headers --file path/to/file
```

## Standard Header Inclusion

Standard library headers will automatically be included when needed. Please note
that at these early stages in development only a few standard headers are
supported, and more will be added according to feedback.

## Structure Inclusion

If a structure typedef is encoutered, the extractor will automatically try and
include a header to that structure. Structures must be named as
"t_s_strcuture_name" for this to work, in which case "s_strcutre_name.h" will be
automatically included. This means you will still have to create the file 
"s_strcutre_name.h" but its inclusion will automatically be handled by the 
extractor as long as you follow naming conventions.

## Command Line Options

|            Option             |                 Usage                  |
|-------------------------------|----------------------------------------|
| extract_headers -h/--help     | displays help info for extract_headers |
| extract_headers -d/--dir      | specifies where to look for c files    |
| extract_headers -v/--verbose  | toggles extra output                   |
