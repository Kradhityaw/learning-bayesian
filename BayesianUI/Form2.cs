using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BayesianUI
{
    public partial class Form2 : Form
    {
        private readonly BayesianDBEntities db = new BayesianDBEntities();

        public Form2()
        {
            InitializeComponent();
        }

        private TResult[] GetCombobox<TResult>(Expression<Func<Criteria, TResult>> selector) =>
            db.Criteria.Select(selector).Distinct().ToArray();

        private Dictionary<string, double> CalculateLikelihood(string featureName, string featureValue)
        {
            var likelyHoods = new Dictionary<string, double>();

            // Mengambil seluruh metode pembelajaran yang ada pada tabel
            var uniqueHypothesis = db.Criteria.Select(f => f.learningMethod).Distinct().ToList();
            // Mengambil total data dalam dataset
            var dataCount = db.Criteria.Count();

            foreach (var hypothesis in uniqueHypothesis)
            {
                var totalHypothesis = db.Criteria.Count(f => f.learningMethod == hypothesis);
                var countFeatureGivenHypothesis = db.Criteria
                    .Where(f => f.learningMethod == hypothesis)
                    .AsEnumerable()
                    .Count(f => f.GetType().GetProperty(featureName)?.GetValue(f)?.ToString() == featureValue);

                double likelihood = (countFeatureGivenHypothesis + 1) / (double)(totalHypothesis + dataCount);
                likelyHoods[hypothesis] = likelihood;
            }

            return likelyHoods;
        }

        private string PredictNaiveBayes(Dictionary<string, string> data)
        {
            var uniqueHypothesis = db.Criteria.Select(f => f.learningMethod).Distinct().ToList();
            var posteriorProbabilities = new Dictionary<string, double>();

            foreach (var hyphothesis in uniqueHypothesis)
            {
                double prior = (double)db.Criteria.Count(f => f.learningMethod == hyphothesis) / db.Criteria.Count();
                double likelihood = 1.0;
                foreach (var feature in data)
                {
                    var likelyHoods = CalculateLikelihood(feature.Key, feature.Value);
                    likelihood *= likelyHoods[hyphothesis];
                }

                var labelHyphotesis = new Label() { Text = $"{hyphothesis}: {Math.Log(likelihood * prior)}", Size = new Size(256, 24) };
                flowLayoutPanel1.Controls.Add(labelHyphotesis);

                posteriorProbabilities[hyphothesis] = likelihood * prior;
            }

            return posteriorProbabilities.OrderByDescending(x => x.Value).First().Key;
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            var allCriteria = db.Criteria.ToList();
            criteriaBindingSource.DataSource = allCriteria;

            comboBox1.Items.AddRange(GetCombobox(f => f.learningStyle));
            comboBox2.Items.AddRange(GetCombobox(f => f.initialUnderstanding));
            comboBox3.Items.AddRange(GetCombobox(f => f.learningMedia));
            comboBox4.Items.AddRange(GetCombobox(f => f.numberOfStudents));
        }

        private void button1_Click(object sender, EventArgs e)
        {
            flowLayoutPanel1.Controls.Clear();
            var data = PredictNaiveBayes(new Dictionary<string, string>()
            {
                { "learningStyle", comboBox1.SelectedItem.ToString() },
                { "initialUnderstanding", comboBox2.SelectedItem.ToString() },
                { "learningMedia", comboBox3.SelectedItem.ToString() },
                { "numberOfStudents", comboBox4.SelectedItem.ToString() }
            });

            label6.Text = data;
        }
    }
}
