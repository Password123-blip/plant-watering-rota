import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Plant Watering Rota",
  description: "Stop killing your plants",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
