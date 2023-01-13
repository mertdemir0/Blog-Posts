# Install the DifferentialEquations package.
using Pkg
Pkg.add("DifferentialEquations")

# Install the Flux package
Pkg.add("Flux")

# Install the CUDA package
Pkg.add("CUDA")

using Flux
using Flux: onehotbatch, onecold, crossentropy, throttle
using Flux: @epochs, onehot, mse, adam, train!, accuracy
using MLDatasets
using CuArrays

# Load the MNIST dataset
images, labels = MNIST.traindata()

# Normalize the data
images = Flux.normalize(images)

# One-hot encode the labels
labels = onehotbatch(labels, 0:9)

# Split the data into training and validation sets
train_images, val_images = images[1:50000], images[50001:end]
train_labels, val_labels = labels[1:50000], labels[50001:end]

# Define the model using a chain of layers
model = Chain(
  Conv((2,2), 1=>32, relu),
  x -> maxpool(x, (2,2)),
  Conv((2,2), 32=>64, relu),
  x -> maxpool(x, (2,2)),
  x -> reshape(x, :, size(x, 4)),
  Dense(7*7*64, 10), softmax
)

# Use cross-entropy loss and the Adam optimizer
loss(x, y) = crossentropy(model(x), y)
opt = Adam()

# Train the model using an epochs macro
@epochs 1 Flux.train!(loss, params(model), zip(train_images, train_labels), opt)

# Evaluate the model on the validation set
accuracy(model, val_images, val_labels)