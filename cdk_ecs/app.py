#!/usr/bin/env python3

from aws_cdk import core

from cdk_ecs.cdk_ecs_stack import CdkEcsStack


app = core.App()
CdkEcsStack(app, "cdk-ecs")

app.synth()
