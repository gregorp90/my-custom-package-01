from setuptools import setup, find_packages

setup(
    name="my_package_01",
    ve22rsion="1.0.3",
    packages=find_packages(),
    install_requires=[
        "python>=3.10",
        "pandas>=1.5.0,<2",
        "pika>=1.3.0"
    ],
    author="Your Name",
    author_email="your.email@example.com",
    description="A short description of my package",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/username/my_package_01",
)
