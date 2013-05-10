---
title: "Automatic differentiation for neighbourhood component analysis"
description: >
  A tutorial on how to apply automatic differentiation to efficiently compute the gradients of a function. We consider the case of a metric learning algorithm&mdash;neighbourhood component analysis.

layout: post
categories: machine-learning, back-propagation
---

The goal of NCA is to find a linear transformation\ $\mathbf{A}$ that maximizes the objective function\ $f$. To achieve this, we may use gradient-based optimization methods. Consequently, the training time is directly influenced by the cost of evaluating the derivative. As pointed out in my master's thesis using straightforward linear algebra to compute the derivative yields a cost of $dDN^2$ flops. We will see that with the help of backpropagation we can improve upon this and achieve a cost of the gradient that is equal to the cost of evaluating the original function: $\mathcal{O}(dDN + dN^2)$.

## Introduction

Before diving into NCA-related derivations, we offer a short overview on backpropagation; the following next two sections will be an exemplification on how to apply backpropagation to the NCA objective function. 


The backpropagation technique is the _de facto_ tool for training neural networks, since it provides an efficient mechanism for computing the derivatives with respect to the input weights. We can leverage the power of backpropagation for general derivative computation, by simply representing the given function in the form of a "neural network," also called _expression graph_. This peculiar neural network is built as follows: it has as inputs the function parameters, the output is the function value and the intermediate nodes correspond to atomic operations[^1] that can be readily evaluated. An example of a possible expression graph for the NCA function is given in figure\ 1.

[^1]: These atomic operations can have different granularity. In our example a node from the expression graph corresponds roughly to a Matlab function or to what can be computed in a Matlab line. 
