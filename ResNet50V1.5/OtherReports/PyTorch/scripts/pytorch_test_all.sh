#/bin/bash

python ./main.py --arch resnet50 \
	-b 128 \
	--training-only \
	-p 1 \
	--raport-file benchmark.json \
	--epochs 1 \
	--prof 100 /imagenet > /log/pytorch_gpu1_fp32_bs128.txt

python ./main.py --arch resnet50 \
	-b 128 \
	--training-only \
	-p 1 \
	--raport-file benchmark.json \
	--epochs 1 \
	--prof 100 \
	--amp \
	--static-loss-scale 256 /imagenet > /log/pytorch_gpu1_amp_bs128.txt

python ./main.py --arch resnet50 \
	-b 254 \
	--training-only \
	-p 1 \
	--raport-file benchmark.json \
	--epochs 1 \
	--prof 100 \
	--amp \
	--static-loss-scale 256 /imagenet > /log/pytorch_gpu1_amp_bs254.txt

python ./multiproc.py --nproc_per_node 8 ./main.py --arch resnet50 \
	-b 128 \
	--training-only \
	-p 1 \
	--raport-file benchmark.json \
	--epochs 1 \
	--prof 100 /imagenet > /log/pytorch_gpu8_fp32_bs128.txt

python ./multiproc.py --nproc_per_node 8 ./main.py --arch resnet50 \
	-b 128 \
	--training-only \
	-p 1 \
	--raport-file benchmark.json \
	--amp \
	--static-loss-scale 256 \
	--epochs 1 \
	--prof 100 /imagenet > /log/pytorch_gpu8_amp_bs128.txt

python ./multiproc.py --nproc_per_node 8 ./main.py --arch resnet50 \
	-b 244 \
	--training-only \
	-p 1 \
	--raport-file benchmark.json \
	--amp \
	--static-loss-scale 256 \
	--epochs 1 \
	--prof 100 /imagenet > /log/pytorch_gpu8_amp_bs244.txt
