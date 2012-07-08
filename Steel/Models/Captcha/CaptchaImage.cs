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
        /// Доступные символы для использования в капче
        /// </summary>
        public static readonly string PosibleChars = "ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz123456789!@#$%&*";

        /// <summary>
        /// Ширина капчи
        /// </summary>
        public int Width
        {
            get
            {
                return Image.Width;
            }
        }

        /// <summary>
        /// Высота капчи
        /// </summary>
        public int Height
        {
            get
            {
                return Image.Height;
            }
        }

        /// <summary>
        /// Количество символов в капче
        /// </summary>
        public int SymbolsCount { get; private set; }

        /// <summary>
        /// Избражение капчи
        /// </summary>
        public Bitmap Image { get; private set; }

        /// <summary>
        /// Текст капчи
        /// </summary>
        public string Text { get; private set; }

        /// <summary>
        /// Создание капчи по умолчнинию 200 х 100 из 4 символов
        /// </summary>
        public CaptchaImage()
            : this(200, 100, 4)
        { }

        /// <summary>
        /// Конструктор создания капчи
        /// </summary>
        /// <param name="width">Ширина</param>
        /// <param name="height">Высота</param>
        /// <param name="symbolsCount">Количиство символов</param>
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

            // Заливаем площадь
            g.FillRectangle(new SolidBrush(Color.FromArgb(230,230,230)), new Rectangle(0, 0, Image.Width, Image.Height));

            // Рисуем каждую букавку
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

            // Куча точек
            for (int i = 0; i < Image.Width*Image.Height/7; i++)
            {
                Point p = new Point(r.Next(0, Image.Width), r.Next(0, Image.Height));
                g.DrawLine(new Pen(Brushes.Gray), p, p+new Size(1,1));
            }
        }
    }
}