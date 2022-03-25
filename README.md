# docker-gitlab

E.g: Documentation
| Setting | Description |
|---------|-------------|
| Kubernetes cluster name | Your cluster's name.  |
| Environment scope       | The associated environment.  | 
| Service role            | The EKS IAM role (role A).  | 
| Kubernetes version      | The Kubernetes version for your cluster.  | 
| Key pair name           | The key pair that you can use to connect to your worker nodes.  | 
| VPC                     | The VPC to use for your EKS Cluster resources.  | 
| Subnets                 | The subnets in your VPC where your worker nodes run. Two are required.  | 
| Security group          | The security group to apply to the EKS-managed Elastic Network Interfaces that are created in your worker node subnets.  |  
| Instance type           | The instance type of your worker nodes.  |  
| Node count              | The number of worker nodes.  |  
| GitLab-managed cluster  | Check if you want GitLab to manage namespaces and service accounts for this cluster.  | 
