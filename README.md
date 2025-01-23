
### Installation

If you plan to use The Well datasets to train or evaluate deep learning models, we recommend to use a machine with enough computing resources.
We also recommend creating a new Python (>=3.10) environment to install the Well. For instance, with [venv](https://docs.python.org/3/library/venv.html):

```
python -m venv path/to/env
source path/to/env/activate/bin
```


#### From Source

It can also be installed from source. For this, clone the [repository](https://github.com/PolymathicAI/the_well) and install the package with its dependencies.

```
git clone https://github.com/PolymathicAI/the_well
cd the_well
pip install .
```

Depending on your acceleration hardware, you can specify `--extra-index-url` to install the relevant PyTorch version. For example, use

```
pip install . --extra-index-url https://download.pytorch.org/whl/cu121
```

to install the dependencies built for CUDA 12.1. 这里cuda版本改一下

#### Benchmark Dependencies

If you want to run the benchmarks, you should install additional dependencies. 需要运行的。

```
pip install the_well[benchmark]
```

### Downloading the Data


Once `the_well` is installed, you can use the `the-well-download` command to download any dataset of The Well.

```
the-well-download --base-path path/to/base --dataset active_matter
```

1. ```path/to/base``` 需要修改成当前目录，建议使用相对路径（比如在the_well目录下直接写 ```./``` ）。
2. 把active_matter修改可以下载其他数据集，我们使用的数据集有(按照优先级）：
   active_matter
   turbulent_radiative_layer_2D
   viscoelastic_instability
   gray_scott_reaction_diffusion
   rayleigh_benard
   shear_flow
3. 数据集下载好应该存放形如：```the_well/datasets/active_matter/data/train或test或val...```。不在的话要挪过来



## Benchmark
修改我添加的shell文件即可。

For instance, to run the training script of default FNO architecture on the active matter dataset, launch the following commands:

```bash
cd the_well/benchmark
python train.py experiment=fno server=local data=active_matter
```

## benchmark常见问题
1. 每次debug时修改了代码文件(.py)都需要：激活虚拟环境->在the_well目录下运行```pip install .```重新安装环境，否则无法保存修改。
2. 当提交的slurm任务没有跑起来时不要修改config文件（.yaml)否则会运行新参数。
3. 

