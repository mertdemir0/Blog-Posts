from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
  return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload():
  file = request.files['file']
  # Process the file and generate a plot
  plot = generate_plot(file)
  return render_template('plot.html', plot=plot)

if __name__ == '__main__':
  app.run()