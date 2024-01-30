# reproducability-study-of-kakao-recoteam-recsys-2022-challenge

This readme should guide you through the process of reproducing the results we reported in our reproducability paper. 

Note that README_original.md refers to the original readme from the paper. 
Please refer to https://github.com/cellularegg/reproducability-study-of-kakao-recoteam-recsys-2022-challenge/tree/main for more details.

## General
We trained the models using a google Colab+ subscription on a V100 GPU. We synced the repository with google drive using:

```
from google.colab import drive
drive.mount('/content/drive')
%cd drive/MyDrive/kakao-recoteam-recsys-2022-challenge/
```
Also, pytroch lightning needs to be installed. This can be done using 

```
!pip3 install pytorch-lightning
```

Note this approach is barebone. Once could also bother and set up a virtual env in Google Colab. We did not.


## Dataloading
Once the data is downloaded, create a /data folder in the root directory of the project. 

Data can be found at https://dressipi.com/downloads/recsys-datasets/

## Preprocessing
Now, execute the following notebook.

```
Internal validation dataset split.ipynb
```

You may have to adapt some paths in order for it to run without problems. 

## SMLP Data Augmentation
in the /mlp folder, before executing the file

```
1-val-mlp-build-data-aug.ipynb
```

search for the line EMBED_DIM = 16 and change it to 256. We assume that this refers to embedding dimension stated in the paper. Now execute the notebook. 

**Be sure to be inside the mlp folder once executing, in order for the folder structure to work. **

The notebook filename seems to have some unsupported chars, so it may happen that it does not download correctly from the main repocitory.

## Training
Now, the SMLP models can be trained using either the,

```
2-val-mlp-model-training-no-shuffle.ipynb
```
or the
```
2-val-mlp-model-training-shuffle.ipynb
```

notebooks. Note that we trained both models, but only used the no-shuffle for detailed evaluation. The evaluation is done using the method validate_models() inside the training notebooks. One could also use the third notebook, but it requires files from preproceyying.py, which we were not able to run for submission=False.

## Tests
To do significance tests, we used our notebook.
```
t-test.ipynb
```

In order to test for significance, we train several models by re-executing the notebook with different seeds. Note that you also need to adapt the model-name in the train-code-cell, otherwise it will be overwritten.


## Remarks
We replaced the original 

```
Internal validation dataset split.ipynb
1-val-mlp-build-data-aug.ipynb
2-val-mlp-model-training-no-shuffle.ipynb
```

with the notebooks we used for training. Those only contain minor adaptions like random seed and also the naming of the stored models. Also, it should be more easibly usable in google colab.
