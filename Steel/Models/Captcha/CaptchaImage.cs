using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.Text;

namespace Steel.Models.Captcha
{
    public sealed class CaptchaImage
    {
        /// <summary>
        /// ��������� ������� ��� ������������� � �����
        /// </summary>
        public static readonly string PosibleChars = "ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz123456789!@#$%&*";

        /// <summary>
        /// ������ �����
        /// </summary>
        public int Width
        {
            get
            {
                return Image.Width;
            }
        }

        /// <summary>
        /// ������ �����
        /// </summary>
        public int Height
        {
            get
            {
                return Image.Height;
            }
        }

        /// <summary>
        /// ���������� �������� � �����
        /// </summary>
        public int SymbolsCount { get; private set; }

        /// <summary>
        /// ���������� �����
        /// </summary>
        public Bitmap Image { get; private set; }

        /// <summary>
        /// ����� �����
        /// </summary>
        public string Text { get; private set; }

        /// <summary>
        /// �������� ����� �� ���������� 200 � 100 �� 4 ��������
        /// </summary>
        public CaptchaImage()
            : this(200, 100, 4)
        { }

        /// <summary>
        /// ����������� �������� �����
        /// </summary>
        /// <param name="width">������</param>
        /// <param name="height">������</param>
        /// <param name="symbolsCount">���������� ��������</param>
        public CaptchaImage(int width, int height, int symbolsCount)
        {
            Image = new Bitmap(width, height);
            SymbolsCount = symbolsCount;
            Text = GenerateRandomText();
            Draw();
        }

        private string GenerateRandomText()
        {
            Random r = new Random();
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < SymbolsCount; i++)
                sb.Append(PosibleChars[r.Next(0, PosibleChars.Length)]);

            return sb.ToString();
        }

        private void Draw()
        {
            Graphics g = Graphics.FromImage(Image);
            g.SmoothingMode = SmoothingMode.HighQuality;
            g.TextRenderingHint = TextRenderingHint.AntiAlias;

            // �������� �������
            g.FillRectangle(new SolidBrush(Color.FromArgb(230,230,230)), new Rectangle(0, 0, Image.Width, Image.Height));

            // ������ ������ �������
            Font f = new Font("Verdana", Height/2f, FontStyle.Bold);
            Random r = new Random();
            float x = r.Next(0, 10);
            float y = r.Next(0, Height / 4);
            for (int i = 0; i < SymbolsCount; i++)
            {
                g.RotateTransform(r.Next(-10, 10));

                g.DrawString(Text[i].ToString(), f,
                             new SolidBrush(Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256))), x, y);

                x += (Width/(SymbolsCount+1)) + r.Next(-10, 10);
                y = r.Next(0, Height/4);

                g.ResetTransform();
            }

            // ���� �����
            for (int i = 0; i < Image.Width*Image.Height/7; i++)
            {
                Point p = new Point(r.Next(0, Image.Width), r.Next(0, Image.Height));
                g.DrawLine(new Pen(Brushes.Gray), p, p+new Size(1,1));
            }
        }
    }
}