# Intens API Infrastructure

Terraform infrastructure for deploying a containerized Java Spring Boot API on AWS using ECS, ECR, Application Load Balancer, and GitHub Actions.

## Project Overview

This repository contains the Infrastructure as Code configuration for the Intens API deployment.

The application is containerized with Docker, pushed to Amazon ECR, and deployed on Amazon ECS. Public traffic is routed through an Application Load Balancer to the ECS service.
