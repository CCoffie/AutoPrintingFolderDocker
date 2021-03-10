# AutoPrintingFolderDocker

Automatically print pdfs within watched folder

```
docker build --tag autoprintingfolder .
docker run -it -v $PWD/watched-folder/:/watched-folder/ autoprintingfolder ipp://10.0.10.108/ipp/print
```
