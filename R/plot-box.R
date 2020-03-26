plot_box <- function(dat, title = "") {
  
  # Put the clusters in the desired order.
  clusters <- c(
    'Alveolar Macrophage', 'AT1/Basal', 'AT2', 'AT2 SFTPA1+HOPX+', 'B cell/Plasma', 'CD4', 'CD8/NK',
    'Ciliated', 'Ciliated TMEM190+ C20orf85+', 'DC', 'Differentiating ciliated', 'Endothelial cells',
    'Endothelial cells NKG7+', 'F0', 'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'Fibroblast', 'Inflammatory monocyte' ,
    'Lymphatic endothelial cells', 'M0', 'M1', 'M10' ,'M11' ,'M12', 'M14', 'M2' ,'M3' ,'M4', 'M5', 'M6' ,'M7' ,'M8' ,'M9', 
    'Macrophage FTL+ FCER1G+ NEAT1+',
    'Macrophage IER3+', 'Proliferating macrophage', 'SPP1+ profibrotic alveolar macrophage', 'T0' ,
    'T1', 'T10', 'T11' ,'T2' ,'T3', 'T4' ,'T5', 'T6', 'T7', 'T8', 'T9', 'Transitional AT2'
  )
  
  # ix_zero <- which(dat$marker == 0)
  # dat$marker[ix_zero] <- dat$marker[ix_zero] + runif(n = length(ix_zero), min = -0.5, max = 0)
  
  dat$cluster <- factor(dat$cluster, levels = clusters)
  p1 <- ggplot() +
    # geom_boxplot() +
    # geom_violin() +
    # geom_jitter(height = 0, width = 0.25, color = "dimgrey", size = 0.3) +
    geom_quasirandom(
      data    = subset(dat, marker > 0),
      # data    = dat,
      mapping = aes(x = cluster, y = marker, fill = cluster),
      shape = 21, stroke = 0.15, size = 2.5
    ) +
    scale_y_continuous(breaks = scales::extended_breaks(n = 4)) +
    scale_x_discrete(limits = rev(levels(dat$cluster))) +
    geom_vline(
      data = data.frame(x = c(10.5, 15.5, 17.5)),
      mapping = aes(xintercept = x),
      color = "grey70"
    ) +
    coord_flip() +
    labs(
      x     = NULL,
      y     = bquote("Log"[2]~"(CPM+1)")
      # title = title
      # subtitle = tsne_subtitle
    ) +
    scale_fill_manual(values = col_vector, name = "Cluster") +
    theme_bw(base_size = 26) + theme(
      legend.position = "none",
      axis.ticks      = element_line(size = 0.5),
      axis.text.y     = element_blank(),
      axis.ticks.y    = element_blank(),
      # axis.text       = element_blank(),
      # axis.ticks      = element_blank(),
      panel.grid      = element_blank(),
      panel.border    = element_rect(size = 0.5),
      plot.title = element_text(size = 30,  face="bold")
    )
  # p1
  
  dat_percent <- dat %>%
    dplyr::group_by(cluster) %>%
    dplyr::summarise(percent = sum(marker > 0) / length(marker) * 100)
  
  p2 <- ggplot() +
    geom_col(
      data = dat_percent,
      mapping = aes(x = cluster, y = percent, fill = cluster),
      color = "black", size = 0.15, width = 0.8
      # fill = "grey60"
    ) +
    geom_vline(
      data = data.frame(x = c(10.5, 15.5, 17.5)),
      mapping = aes(xintercept = x),
      color = "grey70"
    ) +
    scale_fill_manual(values = col_vector, name = "Cluster") +
    scale_x_discrete(limits = rev(levels(dat$cluster))) +
    scale_y_continuous(limits = c(0, 100), breaks = c(0, 50, 100)) +
    labs(x = NULL, y = "% non-zero", title = title) +
    coord_flip() +
    theme_bw(base_size = 26) + theme(
      legend.position = "none",
      axis.ticks      = element_line(size = 0.5),
      # axis.text.y       = element_blank(),
      # axis.ticks.y      = element_blank(),
      panel.grid      = element_blank(),
      panel.border    = element_rect(size = 0.5),
      plot.title      = element_text(size = 25, face = "italic")
    )
  p2 + p1 + plot_layout(widths = c(0.4, 0.6))
}

