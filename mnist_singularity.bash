#!/bin/bash

args=''
for i in "$@"; do
    i="${i//\\/\\\\}"
    args="$args \"${i//\"/\\\"}\""
done

if [ "$args" == "" ]; then args=/bin/bash; fi

singularity exec --nv \
	    --bind /scratch \
	    --overlay /share/apps/pytorch/1.8.0/pytorch-1.8.0.sqf:ro \
	    /share/apps/images/cuda11.1-cudnn8-devel-ubuntu18.04.sif \
	    /bin/bash -c "
source /ext3/env.sh;
export PATH=/share/apps/cuda/11.1.74/bin:\$PATH;
cd mnist
python main.py --epochs=1
$args;
exit;
"