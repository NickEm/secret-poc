# Introduction
* [Spring Cloud AWS](https://github.com/awspring/spring-cloud-aws)
    * [Example of start](https://docs.awspring.io/spring-cloud-aws/docs/3.1.0/reference/html/index.html#spring-cloud-aws-core)
    * [Example of parameter-store](https://docs.awspring.io/spring-cloud-aws/docs/3.1.0/reference/html/index.html#spring-cloud-aws-parameter-store)
        * Order of the properties loading is:
            * Property from the AWS Param Store
            * Property from the `application.yaml` file
            * Property from the VM option
                * From property from VM is the latest override

```shell
aws secretsmanager get-secret-value --secret-id test-secret
```
