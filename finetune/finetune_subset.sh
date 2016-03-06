#!/bin/sh


CAFFE_ROOT="/work/01932/dineshj/CS381V/caffe_install_scripts/caffe"
CAFFE_TOOL="${CAFFE_ROOT}/build/tools"
CAFFE_DATA="${CAFFE_ROOT}/data/flickr_style"
CAFFE_MODEL="${CAFFE_ROOT}/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel"

    # finetune lmdb backend
    ${CAFFE_TOOL}/caffe test -model train_val_lmdb.prototxt -weights ${CAFFE_MODEL} -gpu all
    read -p $'Before finetuning.\nPress [Enter] key to continue.'
    time ${CAFFE_TOOL}/caffe train -solver solver_lmdb.prototxt -weights ${CAFFE_MODEL} -gpu all
    #read -p $'After finetuning.\nPress [Enter] key to continue.'
    #${CAFFE_TOOL}/caffe test -model train_val_lmdb.prototxt -weights finetune_flickr_style_lmdb_iter_1000.caffemodel -gpu all
