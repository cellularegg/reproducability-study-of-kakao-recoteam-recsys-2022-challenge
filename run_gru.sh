#!/bin/bash
mkdir save
for i in {1..5}
do
    python module/models/gru.py --submit=True --num_workers=4 --save_fname=save/gru.pt --seed=$i
done
