First:

```shell
conda create --prefix /Users/gregorpirs/.conda/envs/my-custom-package-01 python=3.11
conda activate
conda install conda-build conda-verify
```

Create a `setup.py` script:

```python
from setuptools import setup, find_packages

setup(
    name="my_package_01",
    version="1.0.1",
    packages=find_packages(),
    install_requires=[
        # Add your package's dependencies here, e.g., "numpy>=1.19.2"
    ],
    author="Your Name",
    author_email="your.email@example.com",
    description="A short description of my package",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/username/my_package_01",
    classifiers=[
        "Development Status :: 5 - Production/Stable",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
    ],
)
```

Create a `./recipe/meta.yaml` script (has to be yaml not yml):

```yaml
package:
  name: my-custom-package-01
  version: 1.0.1

source:
  path: ..

build:
  noarch: python
  number: 0
  script: "{{ PYTHON }} -m pip install . --no-deps -vv"

requirements:
  build:
    - python
    - setuptools
  run:
    - 'python>=3.10'
    - 'pandas>=1.5.0,<2'

test:
  imports:
    - my_custom_package_01

about:
  home: https://github.com/username/my-package
  license: MIT
  summary: 'A short description of my package'
  description: 'A longer description of my package'
  doc_url: https://my-package.readthedocs.io
  dev_url: https://github.com/username/my-package
```

Run:

```shell
conda build recipe
```

