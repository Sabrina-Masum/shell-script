#! /usr/bin/bash
# conda init bash

conda activate gp

DIR=dataset/CIHP_4w
if [ -d "$DIR" ];
then
    echo "$DIR directory exists."
    rm -r dataset/CIHP_4w
else
	echo "$DIR directory does not exist."
fi


DIR1=graphonomy/exp/test/data/datasets/CIHP_4w
if [ -d "$DIR1" ];
then
    echo "$DIR1 directory exists."
    rm -r graphonomy/exp/test/data/datasets/CIHP_4w
else
	echo "$DIR1 directory does not exist."
fi





cd computing-graphonomy/dataset/

python imgGen.py

cd ..





cp -r ./dataset/CIHP_4w/Category_ids  ./dataset/CIHP_4w/Category_rev_ids 

cp -r  dataset/CIHP_4w/lists/test_id.txt  dataset/CIHP_4w/lists/val_id.txt


cp -r ./dataset/CIHP_4w   graphonomy/exp/test/data/datasets/CIHP_4w  


# cd ../..

cd graphonomy/exp/test



python eval_show_pascal2cihp.py --batch 1 --gpus 0 --classes 20 --gt_path './data/datasets/CIHP_4w/Category_ids/'  --txt_file './data/datasets/CIHP_4w/lists/val_id.txt' --loadmodel './data/pretrained_model/inference.pth'
