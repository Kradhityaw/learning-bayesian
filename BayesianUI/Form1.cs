using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BayesianUI
{
    public partial class Form1 : Form
    {
        private List<Dictionary<string, string>> dataset = new List<Dictionary<string, string>>
            {
                new Dictionary<string, string>
                {
                    { "Gaya Belajar", "Visual" },
                    { "Pemahaman Awal", "Tinggi" },
                    { "Media Pembelajaran", "Lengkap" },
                    { "Jumlah Siswa", "Kecil" },
                    { "Metode Pembelajaran", "Demonstrasi" }
                },
                new Dictionary<string, string>
                {
                    { "Gaya Belajar", "Auditori" },
                    { "Pemahaman Awal", "Sedang" },
                    { "Media Pembelajaran", "Cukup" },
                    { "Jumlah Siswa", "Sedang" },
                    { "Metode Pembelajaran", "Ceramah" }
                },
                new Dictionary<string, string>
                {
                    { "Gaya Belajar", "Kinestetik" },
                    { "Pemahaman Awal", "Rendah" },
                    { "Media Pembelajaran", "Kurang" },
                    { "Jumlah Siswa", "Besar" },
                    { "Metode Pembelajaran", "Problem-Based Learning" }
                },
                new Dictionary<string, string>
                {
                    { "Gaya Belajar", "Visual" },
                    { "Pemahaman Awal", "Sedang" },
                    { "Media Pembelajaran", "Cukup" },
                    { "Jumlah Siswa", "Sedang" },
                    { "Metode Pembelajaran", "Diskusi" }
                },
                new Dictionary<string, string>
                {
                    { "Gaya Belajar", "Auditori" },
                    { "Pemahaman Awal", "Tinggi" },
                    { "Media Pembelajaran", "Lengkap" },
                    { "Jumlah Siswa", "Sedang" },
                    { "Metode Pembelajaran", "Demonstrasi" }
                },
                new Dictionary<string, string>
                {
                    { "Gaya Belajar", "Visual" },
                    { "Pemahaman Awal", "Rendah" },
                    { "Media Pembelajaran", "Kurang" },
                    { "Jumlah Siswa", "Besar" },
                    { "Metode Pembelajaran", "Problem-Based Learning" }
                },
                new Dictionary<string, string>
                {
                    { "Gaya Belajar", "Kinestetik" },
                    { "Pemahaman Awal", "Sedang" },
                    { "Media Pembelajaran", "Cukup" },
                    { "Jumlah Siswa", "Kecil" },
                    { "Metode Pembelajaran", "Diskusi" }
                }
            };

        public Form1()
        {
            InitializeComponent();
        }

        private void LoadData()
        {
            // Setup DataTable ke DataGridView
            dataGridView1.DataSource = ConvertToDataTable();

            // Setup Dictionary Value ke Combobox
            comboBox1.DataSource = dataset.Select(f => f["Gaya Belajar"]).Distinct().ToList();
            comboBox2.DataSource = dataset.Select(f => f["Pemahaman Awal"]).Distinct().ToList();
            comboBox3.DataSource = dataset.Select(f => f["Media Pembelajaran"]).Distinct().ToList();
            comboBox4.DataSource = dataset.Select(f => f["Jumlah Siswa"]).Distinct().ToList();

            // Hitung jumlah total data
            int totalData = dataset.Count;

            // Buat dictionary untuk menyimpan prior probability
            var priorProbabilities = dataset
                .GroupBy(f => f["Metode Pembelajaran"])
                .ToDictionary(g => g.Key, g => (double)g.Count() / totalData);

            // Likelyhood Visual
            //var likeliHoodVisual = CalculateLikeliHood("Gaya Belajar", "Visual");

            //foreach (var entry in likeliHoodVisual)
            //{
            //    MessageBox.Show($"P(Gaya Belajar=Visual | {entry.Key}) = {entry.Value}");
            //}
        }

        private string PredictNaiveBayes(Dictionary<string, string> data)
        {
            var uniqueHypothesis = dataset.Select(f => f["Metode Pembelajaran"]).Distinct().ToList();
            var posteriorProbabilities = new Dictionary<string, double>();

            foreach (var hyphothesis in uniqueHypothesis)
            {
                double prior = (double)dataset.Count(f => f["Metode Pembelajaran"] == hyphothesis) / dataset.Count;
                double likelihood = 1.0;
                foreach (var feature in data)
                {
                    var likelyHoods = CalculateLikeliHood(feature.Key, feature.Value);
                    likelihood *= likelyHoods[hyphothesis];
                }

                var labelHyphotesis = new Label() { Text = $"{hyphothesis}: {Math.Log(likelihood * prior)}", Size = new Size(256, 24) };
                flowLayoutPanel1.Controls.Add(labelHyphotesis);

                posteriorProbabilities[hyphothesis] = likelihood * prior;
            }

            return posteriorProbabilities.OrderByDescending(x => x.Value).First().Key;
        }

        private Dictionary<string, double> CalculateLikeliHood(string featureName, string featureValue)
        {
            var likeliHoods = new Dictionary<string, double>();
            var uniqueHypothesis = dataset.Select(f => f["Metode Pembelajaran"]).Distinct().ToList();

            foreach (var hypothesis in uniqueHypothesis)
            {
                int totalWithHypothesis = dataset.Count(f => f["Metode Pembelajaran"] == hypothesis);
                int countFeatureGivenHypothesis = dataset.Count(f =>
                    f["Metode Pembelajaran"] == hypothesis &&
                    f[featureName] == featureValue
                );

                double likelihood = (countFeatureGivenHypothesis + 1) / (double)(totalWithHypothesis + dataset.Count);
                //double likelihood = (countFeatureGivenHypothesis + 1) / (double)totalWithHypothesis;

                likeliHoods[hypothesis] = likelihood;
            }

            return likeliHoods;
        }

        private DataTable ConvertToDataTable()
        {
            DataTable table = new DataTable();

            if (dataset.Count > 0)
            {
                foreach (var column in dataset[0].Keys)
                {
                    table.Columns.Add(column);
                }

                foreach (var row in dataset)
                {
                    table.Rows.Add(row.Values.ToArray());
                }
            }

            return table;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            flowLayoutPanel1.Controls.Clear();
            var data = PredictNaiveBayes(new Dictionary<string, string>()
            {
                { "Gaya Belajar", comboBox1.SelectedItem.ToString() },
                { "Pemahaman Awal", comboBox2.SelectedItem.ToString() },
                { "Media Pembelajaran", comboBox3.SelectedItem.ToString() },
                { "Jumlah Siswa", comboBox4.SelectedItem.ToString() }
            });

            label6.Text = data;
        }
    }
}
