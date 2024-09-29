library(readxl)
df <- read_excel("AOLdataset.xlsx")
View(df)

# 1. Melakukan uji ANOVA satu arah
# Model ANOVA untuk menguji apakah ada perbedaan signifikan antara rata-rata biaya iklan
model <- aov(df$`cost in $1000` ~ df$`type of advertisement`, data = df)

# 2. Menampilkan hasil ANOVA
anova(model)
# p-value < alpha maka tolak h0, artinya terdapat perbedaan rata-rata yang signifikan,
# dengan kata lain terdapat setidaknya satu pasang jenis iklan yang memiliki nilai rata-rata berbeda.

# 3. Jika ANOVA signifikan, lakukan uji post-hoc
# Jika ada perbedaan signifikan, kita perlu melihat lebih lanjut iklan mana yang berbeda.
# Tukey HSD (Honest Significant Difference) digunakan untuk uji post-hoc
library(agricolae)
TukeyHSD(model, conf.level=.95)
# Radio - Koran memiliki p-value > alpha maka tidak signifikan, 
# artinya tidak ada perbedaan signifikan antara rata-rata radio dibandingkan koran.
# TV - Koran memiliki p-value < alpha maka signifakan, 
# artinya terdapat perbedaan signifikan antara rata-rata tv dibandingkan koran.
# TV - Radio memiliki p-value < alpha maka signifikan, 
# artinya terdapat perbedaan signifikan antara rata-rata tv dibandingkan radio.

# 4. Uji Normalitas - Shapiro-Wilk Test
# Hipotesis nol: Data residual berdistribusi normal
library(nortest)
error <- resid(model) # Mengambil residual dari model ANOVA
shapiro.test(error)
# karena p-value < alpha maka tolak h0, artinya error pada model tidak berdistribusi normal normality.
# karena dataset tidak berdistribusi normal maka kami menyarankan untuk
# mengganti model menggunakan regresi robust atau regresi quantil.

# 5. Uji Homoskedastisitas - Breusch-Pagan Test
# Hipotesis nol: Varians residual adalah konstan (homoskedastisitas)
library(lmtest)
bptest(model)
# karena p-value < alpha maka tolak h0, artinya error pada model memiliki variance yang tidak konstan homoskedastisitas.
# karena dataset heteroskedastisitas maka kami menyarankan untuk
# mengganti model menggunakan regresi weighted least squares.

# 6. Uji Autokorelasi - Durbin-Watson Test
# Hipotesis nol: Tidak ada autokorelasi dalam residual
dwtest(model)
# karena p-value > alpha maka gagal tolak h0, artinya tidak ada
# cukup bukti untuk membuktikan error pada model berautokorelasi.
# karena dataset tidak berautokorelasi maka kami menyarankan
# untuk mengganti model menggunakan regresi cochran orcutt.

# 7. Visualisasi hasil ANOVA
plot(model)
# Plot 1 Residual vs Fitted
# Berdasarkan hasil plot diatas, dapat dilihat bahwa tidak terdapat pola yang
# jelas pada sebaran residualnya. Dapat disimpulkan bahwa error memiliki nilai
# variance yang tidak konstan dan asumsi homoskedastisitas tidak terpenuhi.

# Plot 2 Q-Q Residuals
# Berdasarkan hasil plot diatas, dapat dilihat bahwa sebaran residual model
# mendekati garis normalitas hanya dibagian tengah saja. Ini menunjukan
# residualnya tidak berdistribusi normal dan asumsi normalitas tidak terpenuhi.

# Plot 4 Residuals vs Factor Levels
# Berdasarkan hasil plot diatas, dapat dilihat bahwa tidak terdapat pola yang
# jelas pada sebaran residualnya. Dapat disimpulkan bahwa error memiliki nilai
# variance yang tidak konstan dan asumsi homoskedastisitas tidak terpenuhi.